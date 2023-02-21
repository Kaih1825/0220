import 'package:flutter/material.dart';
import '../Values/IsStar.dart';
import 'ListView_dis.dart';
import 'ListView_int.dart';
import 'ListView_na.dart';

class NewsDialog extends StatefulWidget {
  var title;
  var article;
  var image;
  var pos1;
  var pos2;
  NewsDialog({super.key,required this.title,required this.article,required this.image,this.pos1,this.pos2,});
  

  @override
  State<NewsDialog> createState() => _NewsDialogState();
}

class _NewsDialogState extends State<NewsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
    insetPadding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.star,color: isStar.isStarArray[widget.pos1][widget.pos2]?Colors.yellow:Colors.black,),
                onPressed: () {
                  setState(() {
                    isStar.isStarArray[widget.pos1][widget.pos2]=!isStar.isStarArray[widget.pos1][widget.pos2];
                  });
                },
              ),
            ),
            Text(widget.title),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, bottom: 20),
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.grey,
              ),
            ),
            Image.network(widget.image),
            Text(widget.article)
          ],
        ),
      ),
    ),
  );

  }
}
