import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  double _deviceHeight = 0.0;
  double _deviceWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 27, 27, 1),
      body: Container(
        alignment: Alignment.center,
        child: SignupPageUI(),
      ),
    );
  }

  Widget SignupPageUI() {
    return Container(
      height: _deviceHeight * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headingWidget(),
        ],
      ),
    );
  }

  Widget _headingWidget() {
    return Container(
      height: _deviceHeight * 0.12,
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Let's get going!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            Text(
              "Please enter yout details.",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
            ),
          ]),
    );
  }


  Widget _inputForm() {
    return Container(
      height: _deviceHeight * 0.16,
      child: Form(
          // key: _formKey,
          // onChanged: () {
          //   _formKey.currentState?.save();
          // },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          )),
    );
  }
}
