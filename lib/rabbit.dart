class Rabbit {
  // 이렇게 아예 기본값을 넣어줄 것이 아니면, 그냥 String? 이런식으로 optional 지정이 편하다.
  String _name = '';
  RabbitState _state = RabbitState.SLEEP;
  // Rabbit({required this.name, required this.state})
  Rabbit({required String name, required RabbitState state}) {
    this._name = name;
    this._state = state;
  }

  String get name => _name;
  RabbitState get state => _state;

  updateState(RabbitState state) {
    this._state = state;
  }
}

enum RabbitState { SLEEP, RUN, WALK, EAT }
