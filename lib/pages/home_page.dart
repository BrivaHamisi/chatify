import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
    @override
    State<StatefulWidget> createState(){
        return _HomePageState();
    }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(28, 27, 27, 1),
      appBar: AppBar(
        title: const Text("Chatify"),
        centerTitle: true,
        ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}