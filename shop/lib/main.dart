import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'detail.dart';
import 'Assmenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Assmenu> menu = [
    Assmenu("PC", "assets/images/PC.jpg"),
    Assmenu("Tablet", 'assets/images/tablet.jpg'),
    Assmenu("notebook", 'assets/images/notebook.jpg')
  ];
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController dork = TextEditingController();
  TextEditingController cnfpassword = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  void initState() {
    name.text = ""; //innitail value of text field
    price.text = "";
    dork.text = "";
    cnfpassword.text = "";
    mobile.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CIRCLE"),
          centerTitle: true,
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/wall.jpg"),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                    height: 80,
                  ),
                  TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "ENTER NAME",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'Enter you NAME',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                  Container(height: 8),
                  TextField(
                      controller: price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "ENTER PRICE",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'ENTER YOUR PRICE',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                  Container(height: 8),
                  TextField(
                      controller: dork,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "ENTER DORK",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: '6 month    10 month    24 month',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WelcomePage(
                              n: name.text,
                              w: price.text,
                              e: dork.text,
                            ),
                          ),
                        );
                      },
                      child: Text('คำนวณ'))
                ],
              ),
            )));
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 3,
        ));
  }
  //create a function like this so that you can use it wherever you want
}
