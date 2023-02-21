import 'package:flutter/material.dart';
import '../Values/IsStar.dart';
import '../Values/News.dart';
import '../Widgets/NewsDialog.dart';


class ListView_int extends StatefulWidget {
  const ListView_int({super.key});

  @override
  State<ListView_int> createState() => _ListView_intState();
}

class _ListView_intState extends State<ListView_int> {
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
                      intNewsImg[index],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left:5,right:5),
                    child: Text(intNewsTitle[index]+"\n"+intNewsText[index].substring(0,30)+"..."),
                  ),
                ),
              ],
            ),
            onTap: (){
              setState(() {
                showDialog(context: context, builder:(context) {
                return NewsDialog(
                  title:intNewsTitle[index],
                  article:intNewsText[index],
                  image:intNewsImg[index],
                  pos1: 2,
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
