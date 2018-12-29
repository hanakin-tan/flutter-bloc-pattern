import 'package:rxdart/rxdart.dart';
import 'dart:async';

class CounterBloc {
  StreamController counterAdditionController = StreamController();
  Sink get counterAddition => counterAdditionController.sink;

  BehaviorSubject<int> _count = BehaviorSubject<int>(seedValue: 0);
  Stream<int> get countString => _count.stream;

  CounterBloc(){
    counterAdditionController.stream
//                              .where((addition) => (addition % 2 == 0))
                              .listen( (addition) => _count.add(_count.value + 1));
  }

  dispose() {
    counterAdditionController.close();
  }
}
