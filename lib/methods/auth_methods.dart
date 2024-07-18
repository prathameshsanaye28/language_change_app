
/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/home_screen.dart';
import 'package:liveasy/screens/otp_screen.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  /*Future<String> verifyPhone(
      TextEditingController phoneController, BuildContext context) async {
    String res = "Some error occured";
    try {
      _auth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {
            res = ex.toString();
          },
          codeSent: (String verificationid, int? resendtoken) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => OtpScreen(verificationid: verificationid,)));
          },
          codeAutoRetrievalTimeout: (String verificationid) {},
          phoneNumber: phoneController.text.toString());
          res="Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }*/

Future<String> verifyPhone(
    TextEditingController phoneController, BuildContext context) async {
  String res = "Some error occurred";
  try {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException ex) {
        res = ex.toString();
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationid: verificationId), // Changed from verificationid to verificationId
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    res = "Success";
  } catch (err) {
    res = err.toString();
  }
  return res;
}

  Future<String> verifyOTP(
      String verificationid, TextEditingController otpcontroller, BuildContext context) async {
    String res = "Some error occured";
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: verificationid,
          smsCode: otpcontroller.text.toString());
          res="Success";
          _auth.signInWithCredential(credential).then((value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          });
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/home_screen.dart';
import 'package:liveasy/screens/otp_screen.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;

  Future<String> verifyPhone(
      TextEditingController phoneController, BuildContext context) async {
    String res = "Some error occurred";
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${phoneController.text}",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          res = ex.toString();
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationId: verificationId,
                phoneNumber: phoneController.text,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> verifyOTP(
      String verificationId, String otp, BuildContext context) async {
    String res = "Some error occurred";
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        res = "Success";
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> resendOTP(String phoneNumber, BuildContext context) async {
    String res = "Some error occurred";
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          res = ex.toString();
        },
        codeSent: (String verificationId, int? resendToken) {
          res = "OTP resent successfully";
          // Update the verificationId in the OTP screen
          context.updateOtpVerificationId(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        forceResendingToken: null, // You can store and use the resendToken here for better efficiency
      );
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

  




