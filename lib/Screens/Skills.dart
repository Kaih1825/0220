import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:s2/Values/Colors.dart';
import 'package:s2/Values/SkillsInfo.dart';
import '../Widgets/Drawer.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  var selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("職類介紹 Skills")),
      drawer: drawer(
          context,
          List.of([
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.blue,
          ]),
          '/skills',
          '/none'),
      body: Center(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: skillImages.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Center(child: Image.network(skillImages[index])),
                Align(alignment: Alignment.center, child: Text(skillNames[index]))
              ],
            );
          },
        ),
      ),
    );
  }
}
