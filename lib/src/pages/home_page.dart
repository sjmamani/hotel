import 'package:flutter/material.dart';
import 'package:hotel/src/models/box_model.dart';
import 'package:hotel/src/widgets/custom_bar_widget.dart';
import 'package:hotel/src/widgets/hotel_horizontal_widget.dart';
import 'package:hotel/src/widgets/options_box_widget.dart';
import 'package:hotel/src/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: <Widget>[
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                padding: EdgeInsets.only(top: 80.0, bottom: 30.0),
                addAutomaticKeepAlives: false,
                children: <Widget>[
                  _WelcomeText(),
                  SearchBar(),
                  Categories(),
                  HotelHorizontal(
                    title: 'Favorite Hotel',
                    hotels: [
                      'assets/imgs/hotel-1.jpg',
                      'assets/imgs/hotel-2.jpg',
                      'assets/imgs/hotel-3.jpg'
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  HotelHorizontal(
                    title: 'Hotel Near You',
                    hotels: [
                      'assets/imgs/hotel-4.jpg',
                      'assets/imgs/hotel-5.jpg',
                      'assets/imgs/hotel-6.jpg'
                    ],
                  )
                ],
              ),
            ),
            CustomBar(),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<BoxModel> boxes = [
      BoxModel(color: 0xFF00BA80, text: 'Hotel', iconName: 'room_service'),
      BoxModel(color: 0xFFF9544E, text: 'Flight', iconName: 'flight'),
      BoxModel(color: 0xFFF6AC00, text: 'Resto', iconName: 'restaurant'),
      BoxModel(color: 0xFF6C46FE, text: 'More', iconName: 'apps'),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Category',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),
          OptionsBox(boxes)
        ],
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi, Santiago',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'What do you want to book ?',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              height: 1.4,
              letterSpacing: -0.1
            ),
          ),
        ],
      ),
    );
  }
}

// Para borrar el efecto rebote al scrollear la ListView
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
