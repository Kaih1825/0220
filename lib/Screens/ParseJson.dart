import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:s2/Values/json.dart';

class ParseJson extends StatefulWidget {
  const ParseJson({super.key});

  @override
  State<ParseJson> createState() => _ParseJsonState();
}

class _ParseJsonState extends State<ParseJson> {
  var cityList = List.empty(growable: true);
  var countryList = List.empty(growable: true);

  var citySpinnerValue = 0;
  var countrySpinnerValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _parseCity(context);
  }

  void _parseCity(context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("res/citys.json");
    var json = jsonDecode(data);
    cityList.clear();
    for (var i in json) {
      String _city = i['name'].toString();
      cityList.add(_city);
    }
    print(cityList);
    _parseCountry(0);
    setState(() {});
  }

  void _parseCountry(int index) async {
    // var data =
    //     await DefaultAssetBundle.of(context).loadString("res/citys.json");
    var data=jsonData;
    var root = jsonDecode(data)[index]['districts'];
    setState(() {
      countryList.clear();
      for (var i in root) {
        var country = i['name'];
        countryList.add(country);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                menuMaxHeight: 150,
                items: [
                  for (var i = 0; i < cityList.length; i++)
                    DropdownMenuItem(
                      child: Text(cityList[i]),
                      value: i,
                    )
                ],
                onChanged: (value) {
                  setState(() {
                    _parseCountry(value!);
                    citySpinnerValue = value!;
                  });
                },
                value: citySpinnerValue,
              ),
              DropdownButton(
                items: [
                  for (var i = 0; i < countryList.length; i++)
                    DropdownMenuItem(
                      child: Text(countryList[i]),
                      value: i,
                    )
                ],
                onChanged: (value) {
                  setState(() {
                    countrySpinnerValue = value!;
                  });
                },
                value: countrySpinnerValue,
              ),
            ],
          ),
        ));
  }
}
