import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/navigation_service.dart';
import '../services/media_service.dart';
import '../providers/auth_providers.dart';
import '../services/cloud_storage_service.dart';
import '../services/db_service.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  double _deviceHeight = 0.0;
  double _deviceWidth = 0.0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthProvider? _auth;

  File? _image = File('');
  String _name = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 27, 27, 1),
      body: Container(
        alignment: Alignment.center,
        child: ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider.instance, child: registrationPageUI(),
      ),
      )
    );
  }

  Widget registrationPageUI() {
    return Builder(builder: (BuildContext _context){
      _auth = Provider.of<AuthProvider>(_context);
      return Container(
      height: _deviceHeight * 0.75,
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headingWidget(),
          _inputForm(),
          _registerButton(),
          _backtToLoginButton(),
        ],
      ),
    );
    } );
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
              "Please enter your details.",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
            ),
          ]),
    );
  }

  Widget _inputForm() {
    return Container(
      height: _deviceHeight * 0.35,
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
            _imageSelectorWidget(),
            _nameTextfield(),
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _imageSelectorWidget() {
    return Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            File? _imageFile =await MediaService.instance.getImageFromLibrary();
            if (_imageFile != null) {
              setState(() {
                _image = _imageFile;
              });
            }
          },
          child: Container(
            height: _deviceHeight * 0.10,
            width: _deviceHeight * 0.10,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(500),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image:  NetworkImage("https://i.pravatar.cc/300"),
                // _image != null ? FileImage(_image!) :
              ),
            ),
          ),
        ));
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

  Widget _nameTextfield() {
    return TextFormField(
      autocorrect: false,
      style: const TextStyle(color: Colors.white60),
      validator: (_input) {
        return _input?.isNotEmpty == true ? null : "Please enter a name";
      },
      onSaved: (_input) {
        setState(() {
          _name = _input!;
        });
      },
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: "Name",
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
            : "Please enter a Password";
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

  // Widget _registerButton() {
  //   return Align(
  //     alignment: Alignment.center,
  //     child: Container(
  //       height: _deviceHeight * 0.06,
  //       width: _deviceWidth,
  //       margin: EdgeInsets.only(top: 10),
  //       child: MaterialButton(
  //         onPressed: () {
  //           if (_formKey.currentState != null && _formKey.currentState!.validate() && _image != null) {
  //             _auth?.registerUserWithEmailAndPassword(_email, _password, (String _uid) async {
  //               var _result = await CloudStorageService.instance.uploadUserImage(_image!, _uid);
  //               var _imageURL = await _result.ref.getDownloadURL();
  //               await DBService.instance.createUserInDB(_uid, _name, _email, _imageURL);  
  //             });
  //             //Login the User
  //             // _auth?.loginUserWithEmailandPassword(_email, _password);
  //           }
  //         },
  //         color: Colors.blue,
  //         child: const Text(
  //           "REGISTER",
  //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
  //         ),
  //       ),
  //     ),
  //   );
  // }
Widget _registerButton() {
  return Align(
    alignment: Alignment.center,
    child: _auth?.status != AuthStatus.Authenticating ? Container(
      height: _deviceHeight * 0.06,
      width: _deviceWidth,
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate() &&
              _image != null) {
            _auth?.registerUserWithEmailAndPassword(
              _email,
              _password,
              (String _uid) async {
                try {
                  var _imageURL = await CloudStorageService.instance
                      .uploadUserImage(_image!, _uid);
                  await DBService.instance.createUserInDB(
                      _uid, _name, _email, _imageURL);
                } catch (e) {
                  print("Error during registration: $e");
                }
              },
            );
            //Login the User
            // _auth?.loginUserWithEmailandPassword(_email, _password);
          }
        },
        color: Colors.blue,
        child: const Text(
          "REGISTER",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    ) : const Align(alignment: Alignment.center, child: CircularProgressIndicator()),
  );
}

  Widget _backtToLoginButton() {
    return GestureDetector(
        onTap: () {
          NavigationService.instance.goBack();
        },
        child: Container(
          height: _deviceHeight * 0.06,
          width: _deviceWidth,
          child: const Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ));
  }
}
