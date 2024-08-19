import 'package:dars_81_home/ui/widgets/app_logo.dart';
import 'package:dars_81_home/ui/widgets/autentication//registration_phone_inputs.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _phoneControllerr = TextEditingController();
  String initialCountry = 'UZ ';
  PhoneNumber _number = PhoneNumber(isoCode: 'UZ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              child: RegistrationPhoneInputs(phoneNumberController: _phoneControllerr,initialNumber: _number,),
            ),
          ],
        ),
      ),
    );
  }
}
