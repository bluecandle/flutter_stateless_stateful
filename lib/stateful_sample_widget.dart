import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_widget/rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {
  String title;
  Rabbit rabbit;
  StatefulSampleWidget({required this.title, required this.rabbit}) {}

  @override
  State<StatefulSampleWidget> createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic((Duration(seconds: 1)), (timer) {
      int index = timer.tick % 4;

      setState(() {
        switch (index) {
          case 0:

            // StatefulSampleWidget 과 _StatefulSampleWidgetState 은 다른 클래스임.
            // 그래서, rabbit 에 접근하기 위해 widget.rabbit 이런식으로 접근하는 것.
            widget.rabbit.updateState(RabbitState.SLEEP);
            break;

          case 1:
            widget.rabbit.updateState(RabbitState.WALK);
            break;
          case 2:
            widget.rabbit.updateState(RabbitState.RUN);
            break;

          case 3:
            widget.rabbit.updateState(RabbitState.EAT);
            break;
        }
        print(widget.rabbit.state);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
            child: Center(
                child: Text(widget.rabbit.state.toString(),
                    style: TextStyle(fontSize: 30)))));
  }
}
