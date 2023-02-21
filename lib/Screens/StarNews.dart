import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:s2/Values/News.dart';
import '../Values/IsStar.dart';
import '../Widgets/NewsDialog.dart';

class StarNews extends StatefulWidget {
  const StarNews({super.key});

  @override
  State<StarNews> createState() => _StarNewsState();
}

class _StarNewsState extends State<StarNews> {
  var images = [naNewsImg, disNewsImg, intNewsImg];
  var titles = [naNewsTitle, disNewsTitle, intNewsTitle];
  var articles = [naNewsText, disNewsText, intNewsText];

  var countStar=0;
  List pos1 = List.empty(growable: true);
  List pos2 = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (isStar.isStarArray[i][j]) {
            pos1.add(i);
            pos2.add(j);
            countStar++;
          }
        }
      }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("我的最愛"),
      ),
      body: ListView.builder(
        itemCount: countStar,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 5, right: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        child: Image.network(
                          images[pos1[index]][pos2[index]],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(disNewsTitle[index] +
                            "\n" +
                            articles[pos1[index]][pos2[index]]
                                .substring(0, 30) +
                            "..."),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return NewsDialog(
                          title: titles[pos1[index]][pos2[index]],
                          article: articles[pos1[index]][pos2[index]],
                          image: images[pos1[index]][pos2[index]],
                          pos1: pos1[index],
                          pos2: pos2[index],
                        );
                      },
                    );
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
