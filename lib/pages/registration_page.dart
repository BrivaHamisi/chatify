import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }

}

class _RegistrationPageState extends State<RegistrationPage>{ 

  double _deviceHeight = 0.0;
  double _deviceWidth = 0.0;
  
  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    
    return Scaffold();
  }
}