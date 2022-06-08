// ignore_for_file: prefer_is_empty

import 'dart:io';
import 'dart:math';

import 'fish.dart';
import 'aquarium_action.dart';
import 'shark.dart';

void main(List<String> arguments) {
  Aquairum().onStart();
  //Shark().onlive();
}

class Aquairum implements AquariumAction {
  Map<String, Fish> listFish = {};
  List<String> listFishA = [];
  List<String> listFishB = [];
  int countDead = 0;
  onStart() {
    Fish fishA = Fish(FishType.FishA, 'aaaaaaaaaaaa', this);
    Fish fishB = Fish(FishType.FishB, 'bbbbbbbbbbbb', this);
    listFish[fishA.getName()] = fishA;
    listFish[fishB.getName()] = fishB;
    listFishA.add('aaaaaaaaaaaa');
    listFishB.add('bbbbbbbbbbbb');
    showInfo('FishA: ${listFishA.length}, FishB: ${listFishB.length}');
  }

  @override
  int getSizeFish() {
    return listFish.length;
  }

  @override
  int getSizeFishA() {
    return listFishA.length;
  }

  @override
  int getSizeFishB() {
    return listFishB.length;
  }

  @override
  onChoseFish(FishType type, String name) {
    String spuse;
    if (type == FishType.FishA) {
      spuse = subName(listFishB[Random.secure().nextInt(listFishB.length)]);
    } else {
      spuse = subName(listFishA[Random.secure().nextInt(listFishA.length)]);
    }
    name = ongenerateName(name + spuse);
    FishType typeChild = randomType();
    listFish[name] = Fish(typeChild, name, this);
    if (typeChild == FishType.FishA) {
      listFishA.add(name);
    } else {
      listFishB.add(name);
    }
    showInfo(
        'add: $typeChild ; name: $name  FishA: ${listFishA.length}, FishB: ${listFishB.length} ');
  }

  @override
  onDead({String? name, FishType? type}) {
    listFish.remove(name);
    if (type == FishType.FishA) {
      listFishA.removeWhere((element) => element == name);
    } else {
      listFishB.removeWhere((element) => element == name);
    }
    showInfo(
        'dead: $type ; name: $name  FishA: ${listFishA.length}, FishB: ${listFishB.length}');

    if (listFishA.length == 0 || listFishB.length == 0) {
      print('Juflashish uchun baliq tugadi! ');
      exit(0);
    }
  }

  @override
  showInfo(String massage) {
    print(massage);
  }

  @override
  String ongenerateName(String parentName) {
    String words =
        'qwertyuiopsadfghjklzxcvbnmQWERTYUIOPASDFHGJKLZXCVBNM1234567890';
    int lengthWord = words.length;
    for (int i = 0; i < 4; i++) {
      parentName += words[Random.secure().nextInt(lengthWord)];
    }
    return parentName;
  }

  FishType randomType() {
    return Random.secure().nextBool() ? FishType.FishA : FishType.FishB;
  }

  @override
  String subName(String name) {
    return name.substring(name.length ~/ 3 * 2);
  }

  @override
  getFish() {
    return listFish;
  }

  @override
  getFishA() {
    return listFishA;
  }

  @override
  getFishB() {
    return listFishB;
  }

  @override
  bool onWill() {
    if (getSizeFish() > 20) {
      return Random.secure().nextBool();
    } else {
      return true;
    }
  }
}
