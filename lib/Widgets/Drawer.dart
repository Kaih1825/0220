import 'package:flutter/material.dart';
import '../Values/Colors.dart';

Drawer drawer(context, colorArray, nowPage,lastPage) {
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Image.asset(
              "res/Logo_ro.png",
              color: firstScreenBac,
            ),
          ),
        ),
        ListTile(
          title: Text("主畫面 Home", style: TextStyle(color: colorArray[0])),
          onTap: nowPage != '/home'
              ? () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              : (){
                Navigator.pop(context);
              },
        ),
        ListTile(
          title: Text(
            "最新消息 Latest News",
            style: TextStyle(color: colorArray[1]),
          ),
          onTap: nowPage != '/news'
              ? () {
                  nowPage=='/home'?null:Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/news');
                }
              : (){
                Navigator.pop(context);
              },
        ),
        ListTile(
          title: Text("各類技能競賽 Competitions",
              style: TextStyle(color: colorArray[2])),
          onTap: nowPage != '/competitions'
              ? () {
                  nowPage=='/home'?null:Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/competitions');
                }
              : (){
                Navigator.pop(context);
              },
        ),
        ListTile(
          title: Text("職類介紹 Skills", style: TextStyle(color: colorArray[3])),
          onTap: nowPage != '/skills'
              ? () {
                  nowPage=='/home'?null:Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/skills');
                }
              : (){
                Navigator.pop(context);
              },
        ),
      ],
    ),
  );
}
