import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(ColorGenApp());

class ColorGenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color generator app',
      theme: ThemeData(
        primarySwatch: Colors.blue, //toolbar
      ),
      home: ColorGenHomePage(),
    );
  }
}

class ColorGenHomePage extends StatefulWidget {
  ColorGenHomePage({Key key}) : super(key: key);

  @override
  _ColorGenHomePageState createState() => new _ColorGenHomePageState();
}

class _ColorGenHomePageState extends State<ColorGenHomePage> {
  Random random = new Random();

  Color randomColor = Colors.green; // init first color

  void _onTap() {
    setState(() => randomColor =
        Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
  }

  @override
  Widget build(BuildContext context) {
    Widget clickedSection = new GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: randomColor,
        child: Center(child: HelloTextView("Hey there!")),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Color generator app"),
      ),
      body: Container(
        child: clickedSection,
      ),
    );
  }
}

class HelloTextView extends StatelessWidget {
  final String text;

  HelloTextView(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(-0.1),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.blueAccent,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
