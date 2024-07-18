import 'package:flutter/material.dart';
import 'package:liveasy/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100),
              Text(
                AppLocalizations.of(context)!.selectprof,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildProfileCard(
                title: AppLocalizations.of(context)!.shipper,
                icon: Icons.home_outlined,
                description: AppLocalizations.of(context)!.shipdesc,
                value: 'shipper',
              ),
              SizedBox(height: 27),
              _buildProfileCard(
                title: AppLocalizations.of(context)!.transporter,
                icon: Icons.local_shipping_outlined,
                description: AppLocalizations.of(context)!.transdesc,
                value: 'transporter',
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: _selectedProfile != null ? () {
                  // Handle continue button press
                } : null,
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: darkblue
                  ),
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.continueText,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
                )),
                
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String title,
    required IconData icon,
    required String description,
    required String value,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedProfile = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: _selectedProfile,
              activeColor: darkblue,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProfile = newValue;
                });
              },
            ),
            SizedBox(width: 10),
            Icon(icon, size: 50, color: Colors.black),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}