import 'package:assignment/screens/MainFruitScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailScreen extends StatefulWidget {

  String imgUrl;
  String title;
  String price;
  int quantity;
  DetailScreen({this.imgUrl, this.title, this.price, this.quantity});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 1,
            leading: InkWell(
              onTap: () {
                 Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: Text(
              "Products Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: [
                Container(
                    height: 120,
                    width: 280,
                    child: Image.network(
                      widget.imgUrl ?? "",
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.fill,
                    )),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    "Name: " + widget.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.05,
                      height: 1.2,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    "Price: " + widget.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.05,
                      height: 1.2,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    "Qunatity: " + widget.quantity.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.05,
                      height: 1.2,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: InkWell(
            onTap: () async {
              openExitModel();
              
            },
            child: Container(
              padding: EdgeInsets.only(
                left: (25.0),
                right: (25.0),
                bottom: (15.0),
                top: (11.0),
              ),
              child: Container(
                height: (54.0),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Submit" ?? " ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (18.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  openExitModel() {
    showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Thank you for your order"),
            actions: <Widget>[
              FlatButton(
                child: new Text("Yes", style: TextStyle(color: Colors.green)),
                onPressed: () {
                  // exit(0);
                  Fluttertoast.showToast(
                      msg: "Your order submitted sucessfully!!!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 12.0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainFruitScreen()),
                  );
                },
              ),
              FlatButton(
                child: new Text("No", style: TextStyle(color: Colors.green)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        });
  }
}
