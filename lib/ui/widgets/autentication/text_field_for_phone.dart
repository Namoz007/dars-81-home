import 'package:dars_81_home/bloc/phone_bloc/phone_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../bloc/phone_bloc/phone_bloc.dart';
import '../../../bloc/phone_bloc/phone_state.dart';

class TextFieldForPhone extends StatefulWidget {
  PhoneNumber number;
  TextEditingController phoneController;
  TextFieldForPhone({super.key,required this.number,required this.phoneController,});

  @override
  State<TextFieldForPhone> createState() => _TextFieldForPhoneState();
}

class _TextFieldForPhoneState extends State<TextFieldForPhone> {
  String _dialCode = "+998";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InternationalPhoneNumberInput(
          validator: (value){
            if(value == null || value.trim().isEmpty){
              return "Please,return enter phone number";
            }

            try{
              int.parse(value);
              return null;
            }catch(e){
              return "Phone number type not number";
            }
          },
          onInputChanged: (PhoneNumber number) {
            _dialCode = number.dialCode.toString();
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue: widget.number,
          textFieldController: widget.phoneController,
          formatInput: true,
          keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        ),

        const SizedBox(height: 40,),
        BlocBuilder<PhoneBloc, PhoneState>(
          builder: (context, state) {

            if(state is InitialPhoneState){
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      context.read<PhoneBloc>().add(SendSMSPhoneEvent("${_dialCode}${widget.phoneController.text}"));
                    },
                    child:  Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15,),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Send Code",style: TextStyle(fontSize: 16,color: Colors.white,),),
                    ),
                  )
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}
