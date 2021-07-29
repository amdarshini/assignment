import 'package:assignment/screens/Widget/all.dart';
import 'package:assignment/screens/Widget/fruit.dart';
import 'package:assignment/screens/Widget/vegtables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainFruitScreen extends StatefulWidget {
  @override
  _MainFruitScreenState createState() => _MainFruitScreenState();
}

class _MainFruitScreenState extends State<MainFruitScreen>
    with SingleTickerProviderStateMixin {
  String _selectedItem = 'All';
  List _options = [
    'All',
    'Fruits',
    'Vegtables',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              _middleView(),
              if (_selectedItem == "All") Expanded(child: All()),
              if (_selectedItem == "Vegtables") Expanded(child: Vegtables()),
              if (_selectedItem == "Fruits") Expanded(child: Fruit()),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _middleView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Center(
                child: Text(
                  "Fruits and Vegetables",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 2.2,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                icon: Icon(
                  Icons.filter_list,
                ),
                itemBuilder: (BuildContext bc) {
                  return _options
                      .map((fruits) => PopupMenuItem(
                            child: Text(fruits),
                            value: fruits,
                          ))
                      .toList();
                },
                onSelected: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
