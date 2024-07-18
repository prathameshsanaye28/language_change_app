/*import 'package:flutter/material.dart';
import 'package:liveasy/methods/auth_methods.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  OtpScreen({Key? key, required this.verificationId, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _isLoading = false;
   bool _isResending = false;
  late String _verificationId;
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

    @override
  void initState() {
    super.initState();
    _verificationId = widget.verificationId;
  }

  void updateVerificationId(String newVerificationId) {
    setState(() {
      _verificationId = newVerificationId;
    });
  }

  Future<void> _resendOtp() async {
    setState(() {
      _isResending = true;
    });
    String res = await AuthMethods().resendOTP(widget.phoneNumber, context);
    setState(() {
      _isResending = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Verify Phone',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Code is sent to ${widget.phoneNumber}',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40,
                  child: TextField(
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.lightBlue[50],
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive the code? ", style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {
                    // Implement resend logic here
                  },
                  child: Text("Request Again", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _verifyOtp,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("VERIFY AND CONTINUE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E3B62),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });
    String otp = otpControllers.map((controller) => controller.text).join();
    String res = await AuthMethods().verifyOTP(widget.verificationId, otp, context);
    setState(() {
      _isLoading = false;
    });
    if (res != "Success") {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
  }

  
}*/

import 'package:flutter/material.dart';
import 'package:liveasy/methods/auth_methods.dart';
import 'package:liveasy/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  OtpScreen({Key? key, required this.verificationId, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _isLoading = false;
  bool _isResending = false;
  late String _verificationId;
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _verificationId = widget.verificationId;
  }

  void updateVerificationId(String newVerificationId) {
    setState(() {
      _verificationId = newVerificationId;
    });
  }

  Future<void> _resendOtp() async {
    setState(() {
      _isResending = true;
    });
    String res = await AuthMethods().resendOTP(widget.phoneNumber, context);
    setState(() {
      _isResending = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.verifyphone,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.codesentto+' ${widget.phoneNumber}',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40,
                  child: TextField(
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.lightBlue[100],
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.didntreceive, style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: _isResending ? null : _resendOtp,
                  child: _isResending
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(AppLocalizations.of(context)!.reqAgain,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 24),
            /*ElevatedButton(
              onPressed: _isLoading ? null : _verifyOtp,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("VERIFY AND CONTINUE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E3B62),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),*/

            GestureDetector(
              onTap:_isLoading ? null : _verifyOtp,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: darkblue
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white):Text(AppLocalizations.of(context)!.vercontinue,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });
    String otp = otpControllers.map((controller) => controller.text).join();
    String res = await AuthMethods().verifyOTP(_verificationId, otp, context);
    setState(() {
      _isLoading = false;
    });
    if (res != "Success") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
extension OtpScreenStateExtension on BuildContext {
  void updateOtpVerificationId(String newVerificationId) {
    final state = findAncestorStateOfType<_OtpScreenState>();
    state?.updateVerificationId(newVerificationId);
  }
}