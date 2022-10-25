import 'dart:html';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                left: -50,
                top: -dimension.width / 2,
                child: Container(
                  height: dimension.width + 100,
                  width: dimension.width + 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: Colors.blue,
                  ),
                  child: Stack(children: [
                    Positioned(
                      top: dimension.width / 2,
                      left: 20,
                      child: Container(
                        height: dimension.width / 3.5,
                        width: dimension.width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                    Positioned(
                      top: dimension.width / 2 + 60,
                      right: 0,
                      child: Container(
                        height: dimension.width / 3.5,
                        width: dimension.width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      'Transalte These Phrases To English',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            width: 300,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 7), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.pause,
                                      size: 25,
                                      color: Colors.black, //<-- SEE HERE
                                    ),
                                    new Padding(
                                      padding: new EdgeInsets.all(35.0),
                                    ),
                                    Icon(
                                      Icons.message,
                                      size: 25,
                                      color: Colors.blue, //<-- SEE HERE
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Learn Flutter Beginners',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 18),
                    child: TextFormField(
                      minLines: 7,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Your Answer....',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}