import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentication_state.dart';
import 'package:dars_81_home/data/model/registration_request.dart';
import 'package:dars_81_home/main.dart';
import 'package:dars_81_home/ui/screens/authentication/registration_screen.dart';
import 'package:dars_81_home/ui/widgets/app_logo.dart';
import 'package:dars_81_home/ui/widgets/autentication//sign_in_with_app.dart';
import 'package:dars_81_home/ui/widgets/autentication/sign_in_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  String initialCountry = 'UZ ';
  PhoneNumber _number = PhoneNumber(isoCode: 'UZ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const AppLogo(),
              const SizedBox(
                height: 37,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey,
                      ),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignInFields(phoneNumber: _phone, password: _password,initialPhone: _number,),
                      const SizedBox(
                        height: 20,
                      ),
                      const SignInWithApp(),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            context.read<AuthenticationBloc>().add(LogInAuthenticationEvent(query: RegistrationRequest(name: "", phoneNumber: _phone.text, password: _password.text, confirmPassword: '')));
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3F8CFF),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context,state){
                              if(state is LoadingAuthenticationState){
                                return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                              }
                              return const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    color: Colors.white,
                                  )
                                ],
                              );
                            },),),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                          },
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
