import 'package:flutter/cupertino.dart';

class Workout {
  String name;
  String imageName;
  int minutes;
  String audioName;
  int kcal;

  Workout({
    required this.name,
    required this.imageName,
    required this.minutes,
    required this.audioName,
    required this.kcal,
  });
}
