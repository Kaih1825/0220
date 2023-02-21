import 'package:flutter/material.dart';
import 'package:s2/Values/Colors.dart';
import '../Widgets/Drawer.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("職類介紹 Skills")),
      drawer: SafeArea(
        child: drawer(
          context,
          List.of([
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.blue,
          ]),
          '/skills',
          '/none'
        ),
      ),
    );
  }
}
