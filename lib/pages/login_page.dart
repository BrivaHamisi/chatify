import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double _deviceHeight = 0.0;
  double _deviceWidth = 0.0;

  // GlobalKey<FormState> _formKey;
  // Initialize form key properly

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // _LoginPageState(){
  //   _formKey = GlobalKey<FormState>();
  // }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 27, 27, 1),
      body: Align(
        alignment: Alignment.center,
        child: _LoginPageUI(),
      ),
    );
  }

  Widget _LoginPageUI() {
    return Container(
      // color: Colors.red,
      height: _deviceHeight * 0.60,
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headingWidget(),
          _inputForm(),
          _loginButton(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _headingWidget() {
    return Container(
      height: _deviceHeight * 0.12,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Welcome back!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            Text(
              "Please Login to your account",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
            ),
          ]),
    );
  }

  Widget _inputForm() {
    return Container(
      height: _deviceHeight * 0.16,
      child: Form(
          key: _formKey,
          onChanged: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _emailTextField(),
              _passwordTextField(),
            ],
          )),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      autocorrect: false,
      style: TextStyle(color: Colors.white60),
      validator: (_input) {},
      onSaved: (_input) {},
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "Email Adress",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        // hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      style: TextStyle(color: Colors.white60),
      validator: (_input) {},
      onSaved: (_input) {},
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "Password",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        // hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      height: _deviceHeight * 0.06,
      width: _deviceWidth,
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        color: Colors.blue,
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        print("Register Now!");
      },
      child: Container(
        height: _deviceHeight * 0.06,
        width: _deviceWidth,
        // margin: EdgeInsets.only(top: 10),
        child: const Text(
          "REGISTER",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white60),
        ),
      ),
    );
  }
}
