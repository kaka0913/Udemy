//flutter
import 'package:flutter/material.dart';
//package
import 'package:test0805/main.dart';
import 'package:test0805/models/main_model.dart';
import 'package:test0805/views/signup_page.dart';
import 'package:test0805/views/login_page.dart';

void toMyApp({required BuildContext context}) => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
 
void toSignupPage({required BuildContext context}) => Navigator.push(context, MaterialPageRoute(builder: (context) =>const SignupPage()));
 
void toLoginPage({required BuildContext context,required MainModel mainModel}) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(mainModel: mainModel,)));