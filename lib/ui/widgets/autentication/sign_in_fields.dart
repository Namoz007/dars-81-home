import 'package:dars_81_home/bloc/authentication/authentication_bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentication_state.dart';
import 'package:dars_81_home/ui/screens/dashboards/dashboard.dart';
import 'package:dars_81_home/ui/widgets/autentication/text_field_for_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignInFields extends StatefulWidget {
  TextEditingController phoneNumber;
  TextEditingController password;
  PhoneNumber initialPhone;
  SignInFields({super.key,required this.phoneNumber,required this.password,required this.initialPhone,});

  @override
  State<SignInFields> createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<AuthenticationBloc,AuthenticationState>(builder: (context,state){
          if(state is ErrorAuthenticationState){
            return Center(child: Text("${state.message}",style: const TextStyle(color: Colors.red),),);
          }
          return Container();
        }, listener: (context,state){
          if(state is ErrorAuthenticationState){
            if(state.message == '')
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
          }
        },),
        TextFieldForPhone(number: widget.initialPhone, phoneController: widget.phoneNumber),
        const Text("Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty)
              return "Please return email addres";

            if (value.trim().length < 6) return "Min password length 6";

            return null;
          },
          controller: widget.password,
          obscureText: _isShow,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            hintText: '********',
            suffixIcon: InkWell(
              onTap: (){
                setState(() {
                  _isShow = !_isShow;
                });
              },
              child: _isShow ? const Icon(Icons.visibility_off) : const Icon(Icons.remove_red_eye),
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
