import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/model/forecast_model.dart';
import 'package:http/http.dart' as http;
import 'model/RandomModel_list.dart';
class ApiBuilderMap extends StatelessWidget {
  ApiBuilderMap({Key? key}) : super(key: key);

  ForecastModel? forecastModel;

  Future<ForecastModel>fetchData() async {
    String url = "http://api.weatherapi.com/v1/forecast.json?key= 4a536faf63724b8a86a50958232603 &q=Dhaka&days=7&aqi=no&alerts=no";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    forecastModel = ForecastModel.fromJson(data);
    return forecastModel!;
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
              itemCount: snapshot.data!.forecast!.forecastday!.length,
              itemBuilder: (context, index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(snapshot.data!.forecast!.forecastday![index].day!.avgtempC.toString()),
                    Text(forecastModel!.forecast!.forecastday![0].day!.avgtempC.toString())
                  ],
                );
              },
            );
          }
        },),
    );
  }
}
