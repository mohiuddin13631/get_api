import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/model/RandomModel_list.dart';
import 'package:get_api/model/weather_model_map.dart';
import 'package:http/http.dart' as http;

import 'model/address_model.dart';
class KeepList extends StatefulWidget {
  const KeepList({Key? key}) : super(key: key);

  @override
  State<KeepList> createState() => _KeepListState();
}

class _KeepListState extends State<KeepList> {

  List<RandomModel>? myList = [];
  List<AddressModel>? address = [];

  fetchApiData() async {
    String url = "https://random-data-api.com/api/v2/users?size=2&is_xml=true";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    for(var i in data){
      setState(() {
        address!.add(AddressModel.fromJson(i['address'])); //todo: important
        myList!.add(RandomModel.fromJson(i)!);
      });
    }
    print(address);
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
            Text("${myList![0].firstName ?? ""}"),
            Text("${myList![0]!.address!.city ?? ""}"),
            Text("${address![0].streetAddress ?? ""}"),
          ],
        ),
      ),
    );
  }
}
