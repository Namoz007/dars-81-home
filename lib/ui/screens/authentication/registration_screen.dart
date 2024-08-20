import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentication_state.dart';
import 'package:dars_81_home/bloc/phone_bloc/phone_bloc.dart';
import 'package:dars_81_home/bloc/phone_bloc/phone_state.dart';
import 'package:dars_81_home/data/model/registration_request.dart';
import 'package:dars_81_home/ui/screens/dashboards/dashboard.dart';
import 'package:dars_81_home/ui/widgets/app_logo.dart';
import 'package:dars_81_home/ui/widgets/autentication//registration_phone_inputs.dart';
import 'package:dars_81_home/ui/widgets/autentication/registration_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final TextEditingController _phoneControllerr = TextEditingController();
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
                height: 54,
              ),
              const AppLogo(),
              const SizedBox(height: 37,),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 26,horizontal: 20,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey,),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: Text("STEP 1/4",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,),),),
                    const Center(child: Text("Valid your phone",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),),
                    RegistrationFields(name: _name, phoneNumber: _phoneControllerr, password: _password, confirmPassword: _confirmPassword,initialNumber: _number,)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              BlocConsumer<AuthenticationBloc,AuthenticationState>(
                listener: (context,state){
                  if(state is ErrorAuthenticationState){
                    if(state.message == '')
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                  }
                },
                  builder: (context,state){
                if(state is InitialAuthenticationState || state is ErrorAuthenticationState){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            context.read<AuthenticationBloc>().add(SignUpAuthenticationEvent(query: RegistrationRequest(name: _name.text, phoneNumber: _phoneControllerr.text, password: _password.text, confirmPassword: _confirmPassword.text)));
                          }
                        },
                        child: Container(
                          height: 48,
                          width: 145,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent,
                          ),
                          alignment: Alignment.center,
                          child: BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context,state){

                            if(state is LoadingAuthenticationState){
                              return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                            }

                            return const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Next Step",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,),),
                                SizedBox(width: 10,),
                                Icon(CupertinoIcons.arrow_right,color: Colors.white,)
                              ],
                            );
                          }),
                        ),
                      )
                    ],
                  );
                }

                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
