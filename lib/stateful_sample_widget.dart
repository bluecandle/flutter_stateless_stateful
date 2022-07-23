import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_widget/rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {
  String title;
  int value;
  Rabbit rabbit;
  StatefulSampleWidget(
      {required this.title, required this.value, required this.rabbit}) {}

  // 상태 생성.
  @override
  State<StatefulSampleWidget> createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {
  bool stateBool = false;
  // 상태 값 초기 생성
  // 최초 한 번만 실행된다.
  @override
  void initState() {
    super.initState();

    stateBool = false;

    // Timer.periodic((Duration(seconds: 1)), (timer) {
    //   int index = timer.tick % 4;

    //   setState(() {
    //     switch (index) {
    //       case 0:

    //         // StatefulSampleWidget 과 _StatefulSampleWidgetState 은 다른 클래스임.
    //         // 그래서, rabbit 에 접근하기 위해 widget.rabbit 이런식으로 접근하는 것.
    //         widget.rabbit.updateState(RabbitState.SLEEP);
    //         break;

    //       case 1:
    //         widget.rabbit.updateState(RabbitState.WALK);
    //         break;
    //       case 2:
    //         widget.rabbit.updateState(RabbitState.RUN);
    //         break;

    //       case 3:
    //         widget.rabbit.updateState(RabbitState.EAT);
    //         break;
    //     }
    //     print(widget.rabbit.state);
    //   });
    // });
  }

  // 최초 생성 때 한 번 호출됨. initState 와의 차이점?? context 에 접근할 수 있느냐 아니냐의 차이
  // 그래서, context 에 접근하려면 (ex. MediaQuery > 기기 해상도 얻기 | Provider)
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print(MediaQuery.of(context).size);
  }

  // context 가 mount 된 상태에서만 사용 가능.
  // 위젯이 mount 되기 전에 setState 가 호출되는 경우도 발생함 > 정확하게 사이클 맞추지 못해서 그렇다.
  // 그래서, 마운트 되었는지 확인할 필요 있음! (if (mounted) 이런식으로)
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) super.setState(fn);
    print("setState");
  }

  // oldWidget => 이전 상태의 나(widget)
  @override
  void didUpdateWidget(covariant StatefulSampleWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      print(
          'didUpdateWidget oldWidget.value:${oldWidget.value}, widget.value:${widget.value}');
    }
  }

  // scrollController, animationController 이런 것들 dispose 시켜줘야함.
  // 메모리 누수를 막기 위해서!
  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose!');
    super.dispose();
  }

  // 가장 빈번하게 호출 되는 부분 > 따라서, 계산 내용이 많이 들어가면, 앱 퍼포먼스가 많이 떨어짐.
  // 계산을 많이 하는 부분은 상태 초기화 하는 부분에서 최대한 처리하자. (initState, didChangeDependencies)
  @override
  Widget build(BuildContext context) {
    print('build !!');
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
          child: Center(
              child: Text(widget.rabbit.state.toString(),
                  style: TextStyle(fontSize: 30)))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                setState(() => {stateBool = !stateBool})
              },
          child: Text("Button")),
    );
  }
}
