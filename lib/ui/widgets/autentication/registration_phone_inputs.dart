import 'package:dars_81_home/bloc/phone_bloc/phone_bloc.dart';
import 'package:dars_81_home/bloc/phone_bloc/phone_event.dart';
import 'package:dars_81_home/bloc/phone_bloc/phone_state.dart';
import 'package:dars_81_home/ui/widgets/autentication/text_field_for_phone.dart';
import 'package:dars_81_home/ui/widgets/autentication/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegistrationPhoneInputs extends StatefulWidget {
  TextEditingController phoneNumberController;
  PhoneNumber initialNumber;

  RegistrationPhoneInputs({
    super.key,
    required this.phoneNumberController,
    required this.initialNumber,
  });

  @override
  State<RegistrationPhoneInputs> createState() =>
      _RegistrationPhoneInputsState();
}

class _RegistrationPhoneInputsState extends State<RegistrationPhoneInputs> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "STEP 1/4",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Center(
            child: Text(
              "Valid your phone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            "Mobil Number",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          TextFieldForPhone(
            number: widget.initialNumber,
            phoneController: widget.phoneNumberController,
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<PhoneBloc,PhoneState>(
            builder: (context, state) {

              if(state is SendedSMSPhoneState){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Code from SMS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),),
                    const SizedBox(height: 10),
                    VerificationCode(phoneNumber: widget.phoneNumberController.text,)
                  ],
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
