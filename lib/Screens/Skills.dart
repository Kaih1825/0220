import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:s2/Values/Colors.dart';
import 'package:s2/Values/SkillsInfo.dart';
import 'package:s2/Widgets/SkillDialog.dart';
import '../Widgets/Drawer.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  var selected;
  var skillImages=skillImg[0];
  var skillNames=skillText[0];
  var current=0;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: DropdownButton(
                menuMaxHeight: 160,
                items: const [ 
                  DropdownMenuItem(child: Text("全部"),value: 0,),
                  DropdownMenuItem(child: Text("製造工程技術"),value: 1,),
                  DropdownMenuItem(child: Text("營建技術"),value: 2,),
                  DropdownMenuItem(child: Text("資訊與通訊技術"),value: 3,),
                  DropdownMenuItem(child: Text("運輸與物流"),value: 4,),
                  DropdownMenuItem(child: Text("社會與個人服務"),value: 5,),
                  DropdownMenuItem(child: Text("藝術與時尚"),value: 6,),
                  DropdownMenuItem(child: Text("青少年組"),value: 7,),
                  DropdownMenuItem(child: Text("未來職類"),value: 8,)
                ],
                value: current,
                onChanged: (value) {
                  setState(() {
                    current=value!;
                    skillImages=skillImg[value!];
                    skillNames=skillText[value!];
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
              child: Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 580 / 333, //長寬比(寬/長)
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: skillImages.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => SkillDialog(text:skillNames[index],),
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: ImageFiltered(
                              imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Image.network(
                                skillImages[index],
                                fit: BoxFit.fill,
                              ),
                            )),
                            Positioned.fill(
                                child: Container(
                              color: Color.fromARGB(97, 0, 0, 0),
                            )),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  skillNames[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
