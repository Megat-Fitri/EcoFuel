import 'dart:async'; //for Timer
import 'package:lab_assignment1/fuelCalc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds:2),(){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => FuelCalc()),
        );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("EcoFuel",
            style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold, color: Colors.white)
            ),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: Colors.white,),
          ],
          
        ),
      ),
    );
  }
}
