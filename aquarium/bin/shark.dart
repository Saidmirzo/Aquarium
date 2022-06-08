// import 'dart:async';
// import 'dart:math';

// import 'aquarium.dart';
// import 'fish.dart';

// class Shark {
//   late Aquairum aquarium;
//   late FishType typeBait;
//   late String baitName;
//   onlive() {
//     if (aquarium.getSizeFish() > 20) {
//       Timer(Duration(seconds: 10), (() {
//         if (Random.secure().nextBool()) {
//           randomFishA();
//         } else {
//           randomFishB();
//         }
//         Fish.timers.forEach((element) {
//           element.cancel();
//         });
//         aquarium.onDead(name: baitName, type: typeBait);
//       }));
//     }
//   }

//   randomFishA() {
//     baitName = aquarium
//         .getFishA()[Random.secure().nextInt(aquarium.getSizeFish())];
//     typeBait = aquarium.getFish()[baitName].type;
//   }

//   randomFishB() {
//     baitName = aquarium
//         .getFishB()[Random.secure().nextInt(aquarium.getSizeFish())];
//     typeBait = aquarium.getFish()[baitName].type;
//   }
// }
