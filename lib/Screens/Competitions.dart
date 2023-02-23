import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../Values/Colors.dart';
import '../Widgets/Drawer.dart';
import '../Values/CompetitionsInfo.dart';

class Competitions extends StatefulWidget {
  const Competitions({super.key});

  @override
  State<Competitions> createState() => _CompetitionsState();
}

class _CompetitionsState extends State<Competitions>
    with SingleTickerProviderStateMixin {
  var _tabController;
  var currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("關於技能競賽 About")),
      drawer: drawer(
          context,
          List.of([
            Colors.black,
            Colors.black,
            Colors.blue,
            Colors.black,
          ]),
          '/competitions',
          'none'),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            tabs: [
              Tab(text: "競賽日程"),
              Tab(text: "交通資訊與賽場平面圖"),
              Tab(text: "防疫措施"),
              Tab(text: "選手接駁及住宿"),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(currentPage==2) Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(imgs[currentPage][0]),
                  ),
                  if(currentPage!=2) for(var img in imgs[currentPage])Image.network(img,loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress==null?child:CircularProgressIndicator();
                  },)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
