import 'package:flutter/material.dart';
import '../Values/News.dart';

ListView ListView_dis() {
  return ListView.builder(
    padding: EdgeInsets.only(top:5),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top:8.0,bottom:8,left: 5,right: 5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15)),
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
        ),
      );
    },
    itemCount: naNewsText.length,
  );

}
