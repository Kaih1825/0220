import 'package:flutter/material.dart';
import '../Values/IsStar.dart';
import 'package:s2/Widgets/NewsDialog.dart';
import '../Values/News.dart';


class ListView_na extends StatefulWidget {
  const ListView_na({super.key});

  @override
  State<ListView_na> createState() => _ListView_naState();
}

class _ListView_naState extends State<ListView_na> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    padding: EdgeInsets.only(top:5),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top:8.0,bottom:8,left: 5,right: 5),
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                    child: Image.network(
                      naNewsImg[index],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left:5,right:5),
                    child: Text(naNewsTitle[index]+"\n"+naNewsText[index].substring(0,20)+"..."),
                  ),
                ),
              ],
            ),
            onTap: (){
              setState(() {
                showDialog(context: context, builder:(context) {
                return NewsDialog(
                  title:naNewsTitle[index],
                  article:naNewsText[index],
                  image:naNewsImg[index],
                  pos1: 0,
                  pos2: index,
                );
              },);
              });
            },
          ),
        ),
      );
    },
    itemCount: naNewsText.length,
  );
  }
}

