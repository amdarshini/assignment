import 'dart:async';
import 'package:assignment/screens/DetailScreen.dart';
import 'package:assignment/screens/MainFruitScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: MainFruitScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/mainScreen': (context) => MainFruitScreen(),
        '/detailScreen': (context) => DetailScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushNamed(context, '/mainScreen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Fruits and Vegetables",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (14),
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                    height: 120,
                    width: 280,
                    child: Image.network(
                      "https://media.istockphoto.com/photos/fresh-fruits-and-vegetables-picture-id589415708?k=6&m=589415708&s=612x612&w=0&h=yk6a8hZI3HnGuPgCkJqWjqzmfbGqy9bucx1ZUXkXwA8=" ??
                          "",
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.fill,
                    ))),
          ],
        ),
      ),
    );
  }
}
