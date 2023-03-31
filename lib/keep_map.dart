import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class KeepMap extends StatefulWidget {
  const KeepMap({Key? key}) : super(key: key);

  @override
  State<KeepMap> createState() => _KeepMapState();
}

class _KeepMapState extends State<KeepMap> {

  Map<String,dynamic>? weatherData;

  fetchApiData() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?lat=23.765765765765767&lon=90.3853413707394&appid=bf881cd668c8bd1799a36d79a42c897b&unit=matrics";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    setState(() {
      weatherData = Map<String,dynamic>.from(data);
    });
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
            Text("${weatherData!['weather'][0]['main'] ?? ""}"),
          ],
        ),
      ),
    );
  }
}
