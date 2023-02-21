import 'package:flutter/material.dart';
import '../Values/IsStar.dart';
import '../Values/News.dart';
import '../Widgets/NewsDialog.dart';


class ListView_dis extends StatefulWidget {
  const ListView_dis({super.key});

  @override
  State<ListView_dis> createState() => _ListView_disState();
}

class _ListView_disState extends State<ListView_dis> {
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
                      disNewsImg[index],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left:5,right:5),
                    child: Text(disNewsTitle[index]+"\n"+disNewsText[index].substring(0,30)+"..."),
                  ),
                ),
              ],
            ),
            onTap: (){
              setState(() {
                showDialog(context: context, builder:(context) {
                return NewsDialog(
                  title:disNewsTitle[index],
                  article:disNewsText[index],
                  image:disNewsImg[index],
                  pos1: 1,
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

