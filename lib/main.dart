import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/phone_bloc/phone_bloc.dart';
import 'package:dars_81_home/data/repositories/authentication_repositories.dart';
import 'package:dars_81_home/data/repositories/phone_number_repositories.dart';
import 'package:dars_81_home/services/authentication_services.dart';
import 'package:dars_81_home/services/phone_number_services.dart';
import 'package:dars_81_home/ui/screens/authentication/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepositories(servic: AuthenticationServices())),
        RepositoryProvider(create: (context) => PhoneNumberRepositories(servic: PhoneNumberServices())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc(repo: context.read<AuthenticationRepositories>())),
          BlocProvider(create: (context) => PhoneBloc(repo: context.read<PhoneNumberRepositories>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignInScreen(),
        ),
      ),
    );
  }
}
