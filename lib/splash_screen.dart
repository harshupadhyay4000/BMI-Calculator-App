import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/main.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late BuildContext myContext; // Declare a member variable to store the context

  @override
  void initState() {
    super.initState();

    // Store the context when the widget is created
    myContext = context;

    Timer(Duration(seconds: 2), () {
      // Use the stored context here
      Navigator.pushReplacement(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => MyHomePage(title: 'BMI Calculator'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BMI Calculator',
                style: TextStyle(
                    fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/video.gif', // Replace with the path to your GIF
                height: 100, // Adjust the height as needed
                width: 100, // Adjust the width as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
