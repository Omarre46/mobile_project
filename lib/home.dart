import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selected = "None";
  String error = "";
  double _radius = -1;
  double _length = -1;
  double _width = -1;
  double _side = -1;
  double _res = -1;
  double _base = -1;
  double _height = -1;

  TextEditingController _radiusController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  TextEditingController _sideController = TextEditingController();
  TextEditingController _baseController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  void change(String text) {
    setState(() {
      selected = text;

      _res = -1;

      _radiusController.clear(); // Clear the controller for radius
      _lengthController.clear(); // Clear the controller for length
      _widthController.clear(); // Clear the controller for width
      _sideController.clear();
      _heightController.clear();
      _baseController.clear();
      error = "";
    });
  }

  void getRadius(String text) {
    if (text.trim() == "" || double.tryParse(text) == null) {
      setState(() {
        _radius = -1;
      });
    } else {
      _radius = double.parse(text);
    }
  }

  void getLength(String text) {
    if (text.trim() == "" || double.tryParse(text) == null) {
      setState(() {
        _length = -1;
      });
    } else {
      _length = double.parse(text);
    }
  }

  void getWidth(String text) {
    if (text.trim() == "" || double.tryParse(text) == null) {
      setState(() {
        _width = -1;
      });
    } else {
      _width = double.parse(text);
    }
  }

  void getSide(String text) {
    if (text.trim() == "" || double.tryParse(text) == null) {
      setState(() {
        _side = -1;
      });
    } else {
      _side = double.parse(text);
    }
  }

  void getBase(String text) {
    if (text.trim() == "" || double.tryParse(text) == null) {
      setState(() {
        _base = -1;
      });
    } else {
      _base = double.parse(text);
    }
  }

  void getHeight(String text) {
    if (text.trim() == "" || double.tryParse(text) == null) {
      setState(() {
        _height = -1;
      });
    } else {
      _height = double.parse(text);
    }
  }

  void circleArea() {
    if (_radius != -1) {
      setState(() {
        _res = pi * (pow(_radius, 2));
        error = "";
      });
    } else {
      setState(() {
        error = "Please enter valid radius field";
      });
    }
  }

  void rectangleArea() {
    if (_length != -1 && _width != -1) {
      setState(() {
        _res = _length * _width;
        error = "";
      });
    } else {
      setState(() {
        error = "Please enter valid width and length fields";
      });
    }
  }

  void squareArea() {
    if (_side != -1) {
      setState(() {
        _res = (_side * _side);
        error = "";
      });
    } else {
      setState(() {
        error = "Please enter valid side field";
      });
    }
  }

  void triangleArea() {
    if (_base != -1 && _height != -1) {
      setState(() {
        _res = (_base * _height) / 2;
        error = "";
      });
    } else {
      setState(() {
        error = "Please enter valid base and height fields";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.yellowAccent, // Set the icon color to yellow
          ),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  child: Icon(Icons.calculate),
                ),
                Text(
                  "Area Calculator",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )),
      body: Column(
        children: [
          SizedBox(height: 20),
          if (selected !="None")
          Text(
            "You chose: $selected",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Column for Radio buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Circle",
                        style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: MyRadio(
                          value: "Circle",
                          selected: selected,
                          f: change,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Square", style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: MyRadio(
                          value: "Square",
                          selected: selected,
                          f: change,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Rectangle", style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: MyRadio(
                          value: "Rectangle",
                          selected: selected,
                          f: change,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Triangle",
                          style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: MyRadio(
                          value: "Triangle",
                          selected: selected,
                          f: change,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Right Column for TextFields
              Column(
                children: [
                  if (selected == "Circle")
                    Column(
                      children: [
                        MyTextField(
                          hint: "Enter radius",
                          f: getRadius,
                          controller: _radiusController,
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: circleArea,
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  if (selected == "Rectangle")
                    Column(
                      children: [
                        MyTextField(
                          hint: "Enter length",
                          f: getLength,
                          controller: _lengthController,
                        ),
                        MyTextField(
                          hint: "Enter width",
                          f: getWidth,
                          controller: _widthController,
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: rectangleArea,
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  if (selected == "Square")
                    Column(
                      children: [
                        MyTextField(
                          hint: "Enter Side",
                          f: getSide,
                          controller: _sideController,
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: squareArea,
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  if (selected == "Triangle")
                    Column(
                      children: [
                        MyTextField(
                          hint: "Enter base",
                          f: getBase,
                          controller: _baseController,
                        ),
                        MyTextField(
                          hint: "Enter height",
                          f: getHeight,
                          controller: _heightController,
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: triangleArea,
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                ],
              ),
            ],
          ),
          if (_res != -1)
            SizedBox(
              height: 50,
              child: Text(
                "Area of $selected is: ${_res.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          Text(
            "$error",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final Function(String) f;
  final TextEditingController controller;

  MyTextField({
    super.key,
    required this.hint,
    required this.f,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
        onChanged: (value) {
          f(value);
        },
      ),
    );
  }
}

class MyRadio extends StatelessWidget {
  final String selected;
  final String value;
  final Function(String) f;

  MyRadio({
    super.key,
    required this.selected,
    required this.value,
    required this.f,
  });

  @override
  Widget build(BuildContext context) {
    return Radio<String>(
      value: value,
      groupValue: selected,
      onChanged: (text) {
        f(value);
      },
    );
  }
}
