import 'package:flutter/material.dart';
import 'package:lets_go/screens/Register.dart';
import 'package:lets_go/screens/Login.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isRegister = true;
  void changeReg() => setState(() {
    isRegister = !isRegister;
  });

  @override
  Widget build(BuildContext context) {
    return isRegister ? Register(changeReg: changeReg,) : Login(changeReg: changeReg,);
  }
}

