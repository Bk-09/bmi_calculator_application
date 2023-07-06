import 'dart:ffi';
import 'result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:Home(),
));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _currentSliderValue=0;
  int weight=100;
  int age=5;
  double height=66, bmi=0.0;
  bool gender=true; //if gender male
  int bmi_calculator(int wt,double ht,int age,bool gender){
    bmi=((wt/(ht*ht))*703.0);
    if(bmi<18.5)
      return 0; //underweight
    if(bmi<24.9)
      return 1;   //normal
    if(bmi<29.9)
      return 2; //overweight
    if(bmi>=30)
      return 3; //obese
    return 1; //default normal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.tealAccent[700],
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: Colors.blueGrey[800],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 100,
                          width: 50,
                          child: ElevatedButton.icon(onPressed: (){
                            gender=true;
                          }, icon: Icon(Icons.male, size: 50.0,), label: Text('MALE',style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)), style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[800],
                            padding: EdgeInsets.all(5),
                          ),),
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        child:  SizedBox(
                          height: 100,
                          width: 50,
                          child: ElevatedButton.icon(onPressed: (){
                            gender=false;
                          }, icon: Icon(Icons.female, size: 50.0,), label: Text('FEMALE',style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),), style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[800],
                          ),),
                        )
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("HEIGHT", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text("$height"+"in", style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white38),),
                  Slider(
                    value: _currentSliderValue,
                    onChanged: (double value){
                      height=value;
                      setState(() {
                        _currentSliderValue=value;
                      });
                    },
                    max: 108,
                    min: 0,
                    divisions: 108,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white38,
                    thumbColor: Colors.white,
                    label: _currentSliderValue.round().toString(),
                  ),
                ],
              ),
            ),//Container 2
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.blueGrey[800],
                    child: Column(
                      children: [
                        Text('WEIGHT', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color:Colors.white)),
                        Text(weight.toString()+"lb",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight+=1;
                              });
                            }, child: Icon(Icons.arrow_circle_up_outlined), backgroundColor: Colors.blueGrey[600]),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight-=1;
                              });
                            }, child: Icon(Icons.arrow_circle_down_outlined), backgroundColor: Colors.blueGrey[600]),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.blueGrey[800],
                    child: Column(
                      children: [
                        Text('AGE',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color:Colors.white)),
                        Text(age.toString(),style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Colors.white)),
                        Row(
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age+=1;
                              });
                            }, child: Icon(Icons.arrow_circle_up_outlined), backgroundColor: Colors.blueGrey[600]),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age-=1;
                              });
                            }, child: Icon(Icons.arrow_circle_down_outlined), backgroundColor: Colors.blueGrey[600]),
                          ],)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(onPressed: (){
                int status=bmi_calculator(weight, height, age, gender);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Result(
                    status: status,
                    bmi: bmi,
                  );
                }));
              }, child: Text("CALCULATE",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color:Colors.white)), style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[800],
              ),),
            )
          ],
        )
    );
  }
}
