import 'package:assignment/model/fruitModel.dart';
import 'package:assignment/model/fruit_model.dart';
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
              if (_selectedItem == "All") Expanded(child: frutisAndBanana()),
              if (_selectedItem == "Vegtables") Expanded(child: vegetables()),
              if (_selectedItem == "Fruits") Expanded(child: frutis()),
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
        Container(
          width: double.infinity,
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
        SizedBox(
          height: 10,
        ),
        PopupMenuButton(
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
      ],
    );
  }

  Widget frutis() {
    return ListView.separated(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 00),
      itemCount: fruitsOnly.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 00),
          child: Container(
            margin:
                EdgeInsets.only(left: 10, right: 10, top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       // Top Image
                      //       ConstrainedBox(
                      //         constraints: BoxConstraints(
                      //             minHeight: 100, maxHeight: double.infinity),
                      //         child: Container(
                      //           child: CachedNetworkImage(
                      //             filterQuality: FilterQuality.low,
                      //             imageUrl:
                      //                 state.videoDetails[index].vidThumbnail,
                      //             imageBuilder: (context, imageProvider) =>
                      //                 Container(
                      //               decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                   image: imageProvider,
                      //                   fit: BoxFit.fill,
                      //                 ),
                      //               ),
                      //             ),
                      //             placeholder: (context, url) => Container(
                      //               width: MediaQuery.of(context).size.width,
                      //               decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: AssetImage(
                      //                         Constants.defaultffaImage),
                      //                     fit: BoxFit.fill),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                                  "Category: " + fruitsOnly[index].category,
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
                                    color: (fruitsOnly[index].available >= 1)
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
                                          color: Color(0xff808080), width: 0.5),
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
                                      if (fruitsOnly[index].available != 1)
                                        fruitsOnly[index].available--;
                                      // int result =
                                      //     int.parse(fruits[index].price) *
                                      //         fruits[index].available;
                                      // resulttext = result.toString();
                                    });
                                  },
                                  backgroundColor: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(width: (8.0)),
                            new Text(fruitsOnly[index].available.toString(),
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
                                            BorderRadius.circular(100.0)),
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
                                        // int result =
                                        //     int.parse(fruits[index].price) *
                                        //         fruits[index].available;
                                        // resulttext = result.toString();
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
        );
      },
      separatorBuilder: (context, index) {
        return Container(
            child: Divider(
          color: Colors.grey,
          thickness: 0.5,
        ));
      },
    );
  }

  Widget frutisAndBanana() {
    return ListView.separated(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 00),
      itemCount: fruits.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 00),
          child: Container(
            margin:
                EdgeInsets.only(left: 10, right: 10, top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       // Top Image
                      //       ConstrainedBox(
                      //         constraints: BoxConstraints(
                      //             minHeight: 100, maxHeight: double.infinity),
                      //         child: Container(
                      //           child: CachedNetworkImage(
                      //             filterQuality: FilterQuality.low,
                      //             imageUrl:
                      //                 state.videoDetails[index].vidThumbnail,
                      //             imageBuilder: (context, imageProvider) =>
                      //                 Container(
                      //               decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                   image: imageProvider,
                      //                   fit: BoxFit.fill,
                      //                 ),
                      //               ),
                      //             ),
                      //             placeholder: (context, url) => Container(
                      //               width: MediaQuery.of(context).size.width,
                      //               decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: AssetImage(
                      //                         Constants.defaultffaImage),
                      //                     fit: BoxFit.fill),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                              height: 80,
                              width: 230,
                              child: Image.network(
                                fruits[index].imagUrl ?? "",
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
                          fruits[index].vendor,
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
                                  "Name: " + fruits[index].name,
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
                                  "Category: " + fruits[index].category,
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
                      if (fruits[index].available >= 1) SizedBox(height: 07),
                      if (fruits[index].available >= 1)
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Price: Rs." +
                                        // resulttext,
                                        fruits[index].price,
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
                                  fruits[index].available >= 1
                                      ? "Available: " +
                                          fruits[index]
                                              .totalAvailable
                                              .toString()
                                      : " Not Available: " +
                                          fruits[index]
                                              .totalAvailable
                                              .toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.05,
                                    height: 1.2,
                                    color: (fruits[index].available >= 1)
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (fruits[index].available >= 1) SizedBox(height: 07),
                      if (fruits[index].available >= 1)
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
                                          color: Color(0xff808080), width: 0.5),
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
                                      if (fruits[index].available != 1)
                                        fruits[index].available--;
                                      // int result =
                                      //     int.parse(fruits[index].price) *
                                      //         fruits[index].available;
                                      // resulttext = result.toString();
                                    });
                                  },
                                  backgroundColor: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(width: (8.0)),
                            new Text(fruits[index].available.toString(),
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontSize: (12.0),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(width: (8.0)),
                            if (fruits[index].available <
                                fruits[index].totalAvailable)
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
                                      "+",
                                      style: TextStyle(
                                          color: Color(0xff808080),
                                          fontWeight: FontWeight.bold,
                                          fontSize: (40.0)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        fruits[index].available++;
                                        // int result =
                                        //     int.parse(fruits[index].price) *
                                        //         fruits[index].available;
                                        // resulttext = result.toString();
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
        );
      },
      separatorBuilder: (context, index) {
        return Container(
            child: Divider(
          color: Colors.grey,
          thickness: 0.5,
        ));
      },
    );
  }

  Widget vegetables() {
    return ListView.separated(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 00),
      itemCount: fruits.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 00),
          child: Container(
            margin:
                EdgeInsets.only(left: 10, right: 10, top: 10.0, bottom: 10.0),
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
                                fruits[index].imagUrl ?? "",
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
                          fruits[index].vendor,
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
                                  "Name: " + fruits[index].name,
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
                                  "Category: " + fruits[index].category,
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
                      if (fruits[index].available >= 1) SizedBox(height: 07),
                      if (fruits[index].available >= 1)
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Price: Rs." +
                                        // resulttext,
                                        fruits[index].price,
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
                                  fruits[index].available >= 1
                                      ? "Available: " +
                                          fruits[index]
                                              .totalAvailable
                                              .toString()
                                      : " Not Available: " +
                                          fruits[index]
                                              .totalAvailable
                                              .toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.05,
                                    height: 1.2,
                                    color: (fruits[index].available >= 1)
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (fruits[index].available >= 1) SizedBox(height: 07),
                      if (fruits[index].available >= 1)
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
                                          color: Color(0xff808080), width: 0.5),
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
                                      if (fruits[index].available != 1)
                                        fruits[index].available--;
                                      // int result =
                                      //     int.parse(fruits[index].price) *
                                      //         fruits[index].available;
                                      // resulttext = result.toString();
                                    });
                                  },
                                  backgroundColor: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(width: (8.0)),
                            new Text(fruits[index].available.toString(),
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontSize: (12.0),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(width: (8.0)),
                            if (fruits[index].available <
                                fruits[index].totalAvailable)
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
                                      "+",
                                      style: TextStyle(
                                          color: Color(0xff808080),
                                          fontWeight: FontWeight.bold,
                                          fontSize: (40.0)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        fruits[index].available++;
                                        // int result =
                                        //     int.parse(fruits[index].price) *
                                        //         fruits[index].available;
                                        // resulttext = result.toString();
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
        );
      },
      separatorBuilder: (context, index) {
        return Container(
            child: Divider(
          color: Colors.grey,
          thickness: 0.5,
        ));
      },
    );
  }
}
