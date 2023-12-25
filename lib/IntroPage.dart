import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Parameters'),
      ),
      body: Column(
        children: [
          Text('Welcome', style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(
            height: 11,
          )
        ],
      ),
    );
  }
  
}