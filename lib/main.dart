import 'dart:async';

import 'package:flutter/material.dart';
import 'package:s2/Screens/Competitions.dart';
import 'package:s2/Screens/News.dart';
import 'package:s2/Screens/Skills.dart';
import 'package:s2/Screens/StarNews.dart';
import 'Screens/HomeScreen.dart';
import 'Values/Colors.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(              
          brightness: Brightness.light,                 //淺色模式
          seedColor: Color.fromARGB(1, 4, 174, 66),     //主色
          secondary: Color.fromARGB(1, 131, 150, 128),  //第二色
          tertiary: Color.fromARGB(1, 108, 152, 159),   //第三色
        ),
      ),
      home: FirstScreen(),
      routes: {
        '/home':(context) =>const HomeScreen(),
        '/news':(context) => const News(),
        '/competitions':(context) => const Competitions(),
        '/skills':(context) => const Skills(),
        '/star':(context) => const StarNews(),
      },
    );
  }
}


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   Timer(Duration(seconds: 3), () {
    //  Navigator.popAndPushNamed(context, '/menu');
    Navigator.popAndPushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstScreenBac,
      body: Center(
        child: Image.asset("res/Logo.png",width: 100,),
      ),
    );
  }
}

