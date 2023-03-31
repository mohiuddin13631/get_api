import 'package:flutter/material.dart';
import 'package:get_api/keep_list.dart';
import 'package:get_api/keep_map.dart';
import 'package:get_api/list_with_api.dart';

import 'api_buiilder_list.dart';
import 'api_builder_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApiBuilderMap()
    );
  }
}

