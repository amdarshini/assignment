import 'package:assignment/model/fruitModel.dart';
import 'package:assignment/screens/DetailScreen.dart';
import 'package:flutter/material.dart';

class Fruit extends StatefulWidget {
  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<Fruit>
    with SingleTickerProviderStateMixin {
  int selectedId;
  String imageUrl;
  String title;
  String price;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 00),
          itemCount: fruitsOnly.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                if (fruitsOnly[index].available >= 1)
                  setState(() {
                    selectedId = fruitsOnly[index].id;
                    imageUrl = fruitsOnly[index].imagUrl;
                    title = fruitsOnly[index].name;
                    price = fruitsOnly[index].price;
                    quantity = fruitsOnly[index].available;
                  });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 00),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: (selectedId == fruitsOnly[index].id)
                            ? Colors.green
                            : Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  margin: EdgeInsets.only(
                      left: 10, right: 10, top: 10.0, bottom: 10.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      height: 80,
                                      width: 230,
                                      child: Image.network(
                                        fruitsOnly[index].imagUrl ?? "",
                                        filterQuality: FilterQuality.low,
                                        fit: BoxFit.fill,
                                      ))),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  fruitsOnly[index].vendor,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              SizedBox(height: 07),
                              Container(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Name: " + fruitsOnly[index].name,
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
                              ),
                              SizedBox(height: 07),
                              Container(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Category: " +
                                              fruitsOnly[index].category,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.05,
                                            height: 1.2,
                                            color: Colors.grey[900],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (fruitsOnly[index].available >= 1)
                                SizedBox(height: 07),
                              if (fruitsOnly[index].available >= 1)
                                Container(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Price: Rs." +
                                                // resulttext,
                                                fruitsOnly[index].price,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.05,
                                              height: 1.2,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(height: 07),
                              Container(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          fruitsOnly[index].available >= 1
                                              ? "Available: " +
                                                  fruitsOnly[index]
                                                      .totalAvailable
                                                      .toString()
                                              : " Not Available: " +
                                                  fruitsOnly[index]
                                                      .totalAvailable
                                                      .toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.05,
                                            height: 1.2,
                                            color:
                                                (fruitsOnly[index].available >=
                                                        1)
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (fruitsOnly[index].available >= 1)
                                SizedBox(height: 07),
                              if (fruitsOnly[index].available >= 1)
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: (20.0),
                                      width: (20.0),
                                      child: FittedBox(
                                        child:
                                            // ignore: missing_required_param
                                            new FloatingActionButton(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Color(0xff808080),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(100.0)),
                                          elevation: 0,
                                          child: new Text(
                                            "-",
                                            style: TextStyle(
                                                color: Color(0xff808080),
                                                fontWeight: FontWeight.bold,
                                                fontSize: (40.0)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (fruitsOnly[index].available !=
                                                  1)
                                                fruitsOnly[index].available--;
                                            });
                                          },
                                          backgroundColor: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: (8.0)),
                                    new Text(
                                        fruitsOnly[index].available.toString(),
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: (12.0),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(width: (8.0)),
                                    if (fruitsOnly[index].available <
                                        fruitsOnly[index].totalAvailable)
                                      Container(
                                        height: (20.0),
                                        width: (20.0),
                                        child: FittedBox(
                                          child:
                                              // ignore: missing_required_param
                                              new FloatingActionButton(
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xff808080),
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0)),
                                            elevation: 0,
                                            child: new Text(
                                              "+",
                                              style: TextStyle(
                                                  color: Color(0xff808080),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: (40.0)),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                fruitsOnly[index].available++;
                                              });
                                            },
                                            backgroundColor: Color(0xffFFFFFF),
                                          ),
                                        ),
                                      ),
                                  ],
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
                child: Divider(
              color: Colors.grey,
              thickness: 0.5,
            ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: selectedId != null
            ? InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              imgUrl: imageUrl,
                              title: title,
                              price: price,
                              quantity: quantity,
                            )),
                  );
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
                        "Buy" ?? " ",
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
              )
            : Container());
  }
}
