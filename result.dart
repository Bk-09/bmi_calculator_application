import 'dart:ffi';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int status;
  double bmi;
  Result({required this.status, required this.bmi});
  String bmi_rate(int status){
    if(status==0)
      return "UNDERWEIGHT";
    if(status==1)
      return "NORMAL";
    if(status==2)
      return "OVERWEIGHT";
    if(status==3)
      return "OBESE";
    return "";
  }
  String comment(int status){
    if(status==0)
      return "Ooops, you are underweight! Time to diet up!";
    if(status==1)
      return "Congrats! You have a perfectly healthy weight!";
    if(status==2)
      return "Ooops, just a smidge overweight.";
    if(status==3)
      return "Time to diet down. Your weight needs a tone down!";
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[700],
      appBar: AppBar(
        title: Text('Your Result'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey[800],
            child: Text("YOUR RESULT",style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,color:Colors.white)),
          ),
          SizedBox(
            height: 400,
            width: 600,
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(20.0),
              color: Colors.blueGrey[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(bmi_rate(status),style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.tealAccent[700])),
                  Text(bmi.toStringAsFixed(1),style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(comment(status),style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),textAlign: TextAlign.center,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}

