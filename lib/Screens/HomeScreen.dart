import 'dart:async';

import 'package:flutter/material.dart';
import 'package:s2/Values/Colors.dart';
import '../Widgets/Drawer.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _pageController = new PageController(initialPage: 999);
  var dotColor = [Colors.grey.shade500, Colors.white, Colors.white];
  var images = ["res/news/01.jpg", "res/news/02.png", "res/news/03.jpg"];
  var nowPage=999;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      _pageController.animateToPage(nowPage+1, duration: Duration(milliseconds: 500),curve: Curves.decelerate);
     });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("主畫面")),
        drawer: drawer(
          context,
          List.of([
            Colors.blue,
            Colors.black,
            Colors.black,
            Colors.black,
          ]),
          '/home',
          '/home'
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                    child: Container(
                      color: firstScreenBac,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "2023/03/23~25 3 Days",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 3000 * 1423,
                  child: Stack(children: [
                    PageView.builder(
                      itemBuilder: (context, index) {
                        return Image.asset(images[index % 3]);
                      },
                      onPageChanged: (value) {
                        setState(() {
                          nowPage=value;
                          for (int i = 0; i < 3; i++) {
                            dotColor[i] = Colors.white;
                          }
                          dotColor[value % 3] = Colors.grey.shade500;
                        });
                      },
                      controller: _pageController,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 13.0),
                        child: Container(
                          width: 85,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: dotColor[0],
                                      border: Border.all(
                                          color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: dotColor[1],
                                      border: Border.all(
                                          color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: dotColor[2],
                                      border: Border.all(
                                          color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/news');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(children: [
                        Image.asset("res/menu/01.jpg"),
                        Positioned.fill(
                            child: Container(
                          color: gray_tr,
                        )),
                        Positioned.fill(
                            child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: const Center(
                            child: Text(
                              "最新消息 Latest News",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/competitions');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(children: [
                        Image.asset("res/menu/02.png"),
                        Positioned.fill(
                            child: Container(
                          color: gray_tr,
                        )),
                        Positioned.fill(
                            child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: const Center(
                            child: Text(
                              "各類技能競賽 Competitions",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: GestureDetector(
                    onTap: () {
                            Navigator.pushNamed(context, '/skills');
                          },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(children: [
                        Image.asset("res/menu/03.jpg"),
                        Positioned.fill(
                            child: Container(
                          color: gray_tr,
                        )),
                        Positioned.fill(
                            child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: const Center(
                            child: Text(
                              "職類介紹 Skills",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
