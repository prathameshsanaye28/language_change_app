/*import 'package:flutter/material.dart';
import 'package:liveasy/methods/auth_methods.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  bool _isLoading = false;
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter Phone number",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24))
                ),
              ),
              SizedBox(height: 30,),
              _isLoading?CircularProgressIndicator():ElevatedButton(onPressed: ()async{
                setState(() {
                  _isLoading=true;
                });
                String res = await AuthMethods().verifyPhone(phoneController, context);
                
              }, child: Text("Verify phone number"))
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liveasy/methods/auth_methods.dart';
import 'package:liveasy/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  bool _isLoading = false;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.plEnterMobile,
              /*'Please enter your mobile number',*/
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.rcvCode1+"\n"+AppLocalizations.of(context)!.rcvCode2,
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/india_flag.png', width: 24, height: 24),
                        SizedBox(width: 4),
                        Text('   +91  -',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.mobileNo,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            /*ElevatedButton(
              onPressed: _isLoading ? null : () async {
                setState(() {
                  _isLoading = true;
                });
                String res = await AuthMethods().verifyPhone(phoneController, context);
                setState(() {
                  _isLoading = false;
                });
              },
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("CONTINUE",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: darkblue,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),*/

            GestureDetector(
              onTap: _isLoading ? null : () async {
                setState(() {
                  _isLoading = true;
                });
                String res = await AuthMethods().verifyPhone(phoneController, context);
                setState(() {
                  _isLoading = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: darkblue
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white):Text(AppLocalizations.of(context)!.continueText,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
