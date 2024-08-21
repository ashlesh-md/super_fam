import 'package:flutter/material.dart';
import 'success_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPScreen({super.key, required this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> otp = ['', '', '', '', '', ''];
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  bool isOTPValid = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNodes[0]);
    });
  }

  void _onOtpChanged(int index, String value) {
    if (value.isNotEmpty && int.tryParse(value) != null) {
      otp[index] = value;
      if (index < 5) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      otp[index] = '';
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    setState(() {
      isOTPValid = otp.every((digit) => digit.isNotEmpty);
    });
  }

  void _login() {
    if (isOTPValid) {
      String enteredOtp = otp.join('');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessScreen(
            phoneNumber: widget.phoneNumber,
            otp: enteredOtp,
          ),
        ),
      );
    }
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) => _onOtpChanged(index, value),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.indigo[50],
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('OTP Verification',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Phone Number: ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter the 6-digit OTP',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) => _buildOtpField(index)),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isOTPValid ? _login : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Verify OTP',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
