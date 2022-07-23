import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_widget/rabbit.dart';

class StatelessSampleWidget extends StatelessWidget {
  String title;
  Rabbit rabbit;
  StatelessSampleWidget({required this.title, required this.rabbit}) {
    Timer.periodic((Duration(seconds: 1)), (timer) {
      int index = timer.tick % 4;
      switch (index) {
        case 0:
          rabbit.updateState(RabbitState.SLEEP);
          break;

        case 1:
          rabbit.updateState(RabbitState.WALK);
          break;
        case 2:
          rabbit.updateState(RabbitState.RUN);
          break;

        case 3:
          rabbit.updateState(RabbitState.EAT);
          break;
      }

      // 찍어보면, rabbit 의 state 는 계속 변경되지만, 화면은 바뀌지 않음!
      // 즉, StatelessWidget 에서는 상태가 바뀌어도 그 상태 바뀌는걸 바로바로 반영하는 것과는 거리가 멀다.
      print(rabbit.state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
            child: Center(
                child: Text(rabbit.state.toString(),
                    style: TextStyle(fontSize: 30)))));
  }
}
