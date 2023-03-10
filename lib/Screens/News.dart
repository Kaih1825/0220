import 'package:flutter/material.dart';
import 'package:s2/Widgets/ListView_dis.dart';
import 'package:s2/Widgets/ListView_int.dart';
import 'package:s2/Widgets/ListView_na.dart';
import '../Values/Colors.dart';
import '../Widgets/Drawer.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var currentTab = 0;
  late List tabs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    tabs = [ListView_na(), ListView_dis(), ListView_int()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(
          context,
          List.of([
            Colors.black,
            Colors.blue,
            Colors.black,
            Colors.black,
          ]),
          '/news',
          '/none'),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                backgroundColor: firstScreenBac,
                collapsedHeight: 200,
                expandedHeight: 400,
                iconTheme: IconThemeData(color: Colors.white),
                pinned: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                flexibleSpace: SafeArea(
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 10, right: 10, bottom: 10),
                        child: Image.asset("res/Logo_ro.png"),
                      )),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.star,color: Colors.white,),
                          onPressed: () {
                            Navigator.pushNamed(context, '/star');
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.transparent,
                          child: TabBar(
                            padding: EdgeInsets.all(0),
                            indicatorColor: Colors.white,
                            unselectedLabelColor: Colors.grey.shade500,
                            controller: _tabController,
                            labelColor: Colors.white,
                            onTap: (value) {
                              setState(() {
                                currentTab = value;
                              });
                            },
                            tabs: const [
                              Tab(
                                text: "?????????",
                              ),
                              Tab(
                                text: "?????????",
                              ),
                              Tab(
                                text: "?????????",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
          child: tabs[currentTab],
        ),
      ),
    );
  }
}
