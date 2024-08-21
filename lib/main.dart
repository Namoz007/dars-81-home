import 'package:dars_81_home/bloc/admin_bloc/admin_bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/phone_bloc/phone_bloc.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc.dart';
import 'package:dars_81_home/data/repositories/admin_repositories.dart';
import 'package:dars_81_home/data/repositories/authentication_repositories.dart';
import 'package:dars_81_home/data/repositories/phone_number_repositories.dart';
import 'package:dars_81_home/data/repositories/user_repositories.dart';
import 'package:dars_81_home/services/admin_services.dart';
import 'package:dars_81_home/services/authentication_services.dart';
import 'package:dars_81_home/services/phone_number_services.dart';
import 'package:dars_81_home/services/user_services.dart';
import 'package:dars_81_home/ui/screens/authentication/sign_in_screen.dart';
import 'package:dars_81_home/ui/screens/dashboards/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final token = pref.getString("token");
  runApp(MyApp(userIsFind: token != '' && token != null ? true : false,));
}

class MyApp extends StatelessWidget {
  bool userIsFind;
  MyApp({super.key,required this.userIsFind});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepositories(servic: AuthenticationServices())),
        RepositoryProvider(create: (context) => PhoneNumberRepositories(servic: PhoneNumberServices())),
        RepositoryProvider(create: (context) => UserRepositories(services: UserServices())),
        RepositoryProvider(create: (context) => AdminRepositories(services: AdminServices())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc(repo: context.read<AuthenticationRepositories>())),
          BlocProvider(create: (context) => PhoneBloc(repo: context.read<PhoneNumberRepositories>())),
          BlocProvider(create: (context) => UserBloc(repo: context.read<UserRepositories>())),
          BlocProvider(create: (context) => AdminBloc(repo: context.read<AdminRepositories>()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: userIsFind ? const Dashboard() : const SignInScreen(),
        ),
      ),
    );
  }
}
