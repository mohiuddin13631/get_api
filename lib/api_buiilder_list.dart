import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/RandomModel_list.dart';
class ApiWithBuilder extends StatelessWidget {
  ApiWithBuilder({Key? key}) : super(key: key);

  List<RandomModel> myList = [];
  
  Future<List<RandomModel>>fetchData() async {
    String url = "https://random-data-api.com/api/v2/users?size=2&is_xml=true";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    
    for(var i in data){
      myList.add(RandomModel.fromJson(i));
    }
    return myList;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(myList[index].address!.coordinates!.lat.toString()),
                  Text(snapshot.data![index].address!.coordinates!.lng.toString())
                ],
              );
            },
          );
        }
      },),
    );
  }
}
