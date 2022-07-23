import 'package:flutter/material.dart';
import 'package:sample_widget/rabbit.dart';
import 'package:sample_widget/stateful_sample_widget.dart';
import 'package:sample_widget/stateless_sample_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: StatefulSampleWidget(
          title: '구멍이 있는 박스로 실험.',
          rabbit: Rabbit(name: '토끼2', state: RabbitState.SLEEP)),
    );
  }
}
