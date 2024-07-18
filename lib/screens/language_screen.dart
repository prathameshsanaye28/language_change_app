/*import 'package:flutter/material.dart';
import 'package:liveasy/screens/login_screen.dart';
import 'package:liveasy/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Hindi']; // Add more languages as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 100, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      'Please select your Language',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You can change the language at any time.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.7,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedLanguage,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLanguage = newValue!;
                            });
                          },
                          items: _languages.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(fontSize: 20),),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    /*ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneAuth()));
                      },
                      child: Text('NEXT'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkblue,
                        minimumSize: Size(double.infinity, 50),
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),*/
                    GestureDetector(
              onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneAuth()));
                      },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  color: darkblue
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ),
            ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/waves.png"),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*class CustomPaintWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 100),
      painter: WavePainter(),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.9,
        size.width, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path2 = Path();

    path2.moveTo(0, size.height * 0.9);
    path2.quadraticBezierTo(
        size.width * 0.25, size.height,
        size.width * 0.5, size.height * 0.9);
    path2.quadraticBezierTo(
        size.width * 0.75, size.height * 0.8,
        size.width, size.height * 0.9);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}*/

import 'package:flutter/material.dart';
import 'package:liveasy/screens/login_screen.dart';
import 'package:liveasy/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final Function(Locale) setLocale;

  const LanguageSelectionScreen({Key? key, required this.setLocale}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Hindi'];

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    
    Locale newLocale = language == 'English' ? Locale('en') : Locale('hi');
    widget.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 100, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.pleaseSelectLanguage,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.languageChangeInfo,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.7,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedLanguage,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              _changeLanguage(newValue);
                            }
                          },
                          items: _languages.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(fontSize: 20)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuth()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width*0.7,
                        decoration: BoxDecoration(
                          color: darkblue
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            AppLocalizations.of(context)!.next,
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/waves.png"),
            ),
          ],
        ),
      ),
    );
  }
}