import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_widget/rabbit.dart';
import 'package:sample_widget/stateful_sample_widget.dart';
import 'package:sample_widget/stateless_sample_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = 0;

    Timer.periodic((Duration(seconds: 1)), (timer) {
      // 이거때문에 stateful sample widget 에서 didUpdateWidget 가 호출되고, 그로 인해 build 가 호출된다!
      setState(() {
        value++;
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: StatelessSampleWidget(
      //     title: '구멍이 없는 박스로 실험.',
      //     rabbit: Rabbit(name: '토끼1', state: RabbitState.SLEEP)),
      home: value > 10
          ? Container()
          : StatefulSampleWidget(
              title: '구멍이 있는 박스로 실험.',
              // 이런식으로 특정 위젯에 부모 위젯 state 의 변경을 전달할 수 있다.
              value: value,
              rabbit: Rabbit(name: '토끼2', state: RabbitState.SLEEP)),
    );
  }
}
