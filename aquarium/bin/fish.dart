import 'dart:async';

import 'dart:math';

import 'fish_action.dart';
import 'aquarium_action.dart';

class Fish implements FishAction {
  FishType type;
  late AquariumAction action;
  late String _name;
  late int liveTime;
  static List<Timer> timers = [];

  Fish(this.type, this._name, this.action) {
    liveTime = randomInt(25) + 25;
    onlive();
  }

  @override
  onlive() {
    Timer(Duration(seconds: liveTime), () => onDead());
    onChose();
  }

  @override
  onChose() {
    int count;
    // if (action.getSizeFish() > 25) {
    //   count = randomInt(1) + 1;
    // } else {
    //   count = randomInt(2) + 1;
    // }
    count = randomInt(2) + 1;

    int time = 0;
    for (int i = 0; i < count; i++) {
      int currentTime = randomInt(liveTime);
      if (time != currentTime) {
        time = currentTime;
        Timer t = Timer(
          Duration(seconds: time),
            () => action.onChoseFish(type, action.subName(_name)));
        timers.add(t);
      } else {
        i--;
        continue;
      }
    }
  }

  @override
  onDead() {
    timers.forEach((element) {
      element.cancel();
    });
    action.onDead(name: _name, type: type);
  }

  @override
  String getName() {
    return _name;
  }

  int randomInt(int a) {
    int natija = Random.secure().nextInt(a);
    return natija;
  }
}

enum FishType { FishA, FishB }
