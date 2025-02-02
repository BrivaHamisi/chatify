import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_providers.dart';
import '../services/snackbar_service.dart';
import '../services/navigation_service.dart';

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
  AuthProvider? _auth;

  String _email = '';
  String _password = '';

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
        child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance, child: _LoginPageUI()),
      ),
    );
  }

  Widget _LoginPageUI() {
    return Builder(builder: (BuildContext _context) {
      SnackbarService.instance.buildContext = context;
      _auth= Provider.of<AuthProvider>(_context);
      print(_auth?.user);
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
    });
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
          onChanged: () {
            _formKey.currentState?.save();
          },
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
      style: const TextStyle(color: Colors.white60),
      validator: (_input) {
        return _input?.isNotEmpty == true && _input?.contains("@") == true
            ? null
            : "Please enter a valid email";
      },
      onSaved: (_input) {
        setState(() {
          _email = _input!;
        });
      },
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: "Email Adress",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      style: TextStyle(color: Colors.white60),
      validator: (_input) {
        return _input?.isNotEmpty == true && (_input?.length ?? 0) >= 6
            ? null
            : "Please enter a valid password";
      },
      onSaved: (_input) {
        setState(() {
          _password = _input!;
        });
      },
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: "Password",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return (_auth?.status == AuthStatus.Authenticating) == true ? Align(alignment: Alignment.center, child: CircularProgressIndicator()) : Container(
      height: _deviceHeight * 0.06,
      width: _deviceWidth,
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            //Login the User
            _auth?.loginUserWithEmailandPassword(_email, _password);
          }
        },
        color: Colors.blue,
        child: const Text(
          "LOGIN",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        print("Register Now!");
        NavigationService.instance.navigateTo("register");
      },
      child: Container(
        height: _deviceHeight * 0.06,
        width: _deviceWidth,
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
