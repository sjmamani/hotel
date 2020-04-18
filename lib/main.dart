import 'package:flutter/material.dart';
import 'package:hotel/src/pages/home_page.dart';
import 'package:hotel/src/pages/hotel_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel App',
      theme: ThemeData(fontFamily: 'Poppins', primaryColor: Color(0xFF6C46FE)),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'hotel': (context) => HotelDetailPage(),
      },
    );
  }
}
