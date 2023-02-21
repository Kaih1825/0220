import 'package:flutter/material.dart';
import '../Values/Colors.dart';
import '../Widgets/Drawer.dart';

class Competitions extends StatefulWidget {
  const Competitions({super.key});

  @override
  State<Competitions> createState() => _CompetitionsState();
}

class _CompetitionsState extends State<Competitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("各類技能競賽 Competitions")),
      drawer: SafeArea(
        child: drawer(
          context,
          List.of([
            Colors.black,
            Colors.black,
            Colors.blue,
            Colors.black,
          ]),
          '/competitions',
          'none'
        ),
      ),
    );
  }
}
