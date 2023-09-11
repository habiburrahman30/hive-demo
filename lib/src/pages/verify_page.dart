import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setSystemUIOverlayStyle();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight * 0.44,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0062BD).withOpacity(0.85),
              Color(0xFF0062BD).withOpacity(0.0),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.095),
            Text(
              "Verify Phone",
            ),
            SizedBox(height: screenHeight * 0.13),
          ],
        ),
      ),
    );
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(setTheSystemUIOverlayStyle());
  }

  static SystemUiOverlayStyle setTheSystemUIOverlayStyle({
    Color systemNavigationBarColor = Colors.transparent,
    Color statusBarColor = Colors.transparent,
    Brightness statusBarBrightness = Brightness.light,
  }) {
    return SystemUiOverlayStyle(
      // systemNavigationBarColor: systemNavigationBarColor,
      statusBarColor: statusBarColor,
      statusBarBrightness: statusBarBrightness,
    );
  }
}
