import 'package:flutter/material.dart';
import 'package:quizzler/firstScreen.dart';
import 'package:quizzler/secondScreen.dart';
import 'package:quizzler/thirdScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Quizzler'),
            bottom:
                const TabBar(physics: NeverScrollableScrollPhysics(), tabs: [
              Tab(
                text: 'True or False',
              ),
              Tab(
                text: 'Math Quiz',
              ),
              Tab(
                text: 'Contact Us',
              ),
            ]),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [FirstScreen(), SecondScreen(), ThirdScreen()],
          )),
    ));
  }
}
