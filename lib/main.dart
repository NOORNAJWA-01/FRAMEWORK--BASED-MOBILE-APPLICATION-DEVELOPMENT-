import 'package:flutter/material.dart';
import 'package:project1/myBooking.dart';
import 'bookingDetails.dart';
import 'courtSelection.dart';
import 'homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => HomeScreen(),
      '/first': (context) => bookingDetails(),
      '/second': (context) => courtSelection(
            matricNo: '',
            date: '',
            time: '',
            duration: '',
          ),
      '/third': (context) => myBooking(
          matricNo: '', date: '', time: '', duration: '', selectedCourt: ''),
    });
  }
}
