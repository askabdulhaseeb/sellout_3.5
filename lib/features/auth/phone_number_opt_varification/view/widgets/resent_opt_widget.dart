import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../signup/view/providers/signup_provider.dart';

class ResetOtpWidget extends StatefulWidget {
  const ResetOtpWidget({super.key});

  @override
  State<ResetOtpWidget> createState() => _ResetOtpWidgetState();
}

class _ResetOtpWidgetState extends State<ResetOtpWidget> {
  Timer? _timer = Timer.periodic(const Duration(seconds: 1), (_) {});
  int _start = kDebugMode ? 10 : 60;

  @override
  void initState() {
    resetTimer();
    super.initState();
  }

  void resetTimer() {
    _timer?.cancel();
    _start = kDebugMode ? 10 : 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _timer?.isActive ?? false
        ? Text(
            'Resend OTP in $_start s',
            style: const TextStyle(color: Colors.grey),
          )
        : TextButton(
            onPressed: () {
              Provider.of<SignupProvider>(context, listen: false)
                  .resendOtp(context);
              resetTimer();
            },
            child: const Text('Resent OTP'),
          );
  }
}
