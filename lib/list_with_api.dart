import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/model/RandomModel_list.dart';
import 'package:get_api/model/particular_model.dart';
import 'package:get_api/model/weather_model_map.dart';
import 'package:http/http.dart' as http;

import 'model/address_model.dart';
class ListWithApi extends StatefulWidget {
  const ListWithApi({Key? key}) : super(key: key);

  @override
  State<ListWithApi> createState() => _ListWithApiState();
}

class _ListWithApiState extends State<ListWithApi> {

  List<ParticularModel> dataList = [];

  fetchApiData() async {
    String url = "https://random-data-api.com/api/v2/users?size=2&is_xml=true";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    for(var i in data){
      ParticularModel particularModel =  ParticularModel( //todo: important
        title: i['employment']['title'],
        key_skill: i['employment']['key_skill']
      );
      setState(() {
        dataList.add(particularModel);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataList[0].title.toString())
          ],
        ),
      ),
    );
  }
}
