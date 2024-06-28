import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpInputWidget extends StatefulWidget {
  const OtpInputWidget({required this.onSubmit, super.key});
  final void Function(String)? onSubmit;

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      borderColor: Theme.of(context).primaryColor,
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      fieldWidth: MediaQuery.of(context).size.width / 9,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: widget.onSubmit,
    );
  }
}
