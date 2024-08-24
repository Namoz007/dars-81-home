import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentication_state.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc_event.dart';
import 'package:dars_81_home/ui/screens/authentication/registration_screen.dart';
import 'package:dars_81_home/ui/screens/authentication/sign_in_screen.dart';
import 'package:dars_81_home/ui/screens/dashboards/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(StartAuthenticationEvent());
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc,AuthenticationState>(
        builder: (context, state) {
          return const Center(child: Text("CRM SYSTEM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 22),),);
        },
        listener: (context, state) {
          if(state is AuthenticatedAuthenticationState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
          }

          if(state is UnAuthenticatedAuthenticationState){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
          }

          if(state is ComedUserAuthenticationState){
            context.read<UserBloc>().add(ComedUserBlocEvent(state.userModel));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
          }
        },
      ),
    );
  }
}
