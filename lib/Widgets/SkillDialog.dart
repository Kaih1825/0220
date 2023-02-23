import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:s2/Values/SkillsInfo.dart';

class SkillDialog extends StatefulWidget {
  String text;
  SkillDialog({super.key,required this.text});

  @override
  State<SkillDialog> createState() => _SkillDialogState();
}

class _SkillDialogState extends State<SkillDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.text,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("為什麼全國技能競賽職類介紹對我們來說這麼重要？俾斯麥在不經意間這樣說過，失敗是堅忍的最後考驗。這果然是一句至理名言。至於為什麼要思考全國技能競賽職類介紹呢？其實是有更深層的原因，所謂全國技能競賽職類介紹，關鍵是全國技能競賽職類介紹需要如何寫。全國技能競賽職類介紹，到底應該如何實現。全國技能競賽職類介紹因何而發生？",style: TextStyle(fontSize: 15),),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("關閉")),
          ],
        ),
      ),
    );
  }
}