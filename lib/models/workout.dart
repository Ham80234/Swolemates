import 'package:flutter/material.dart';
import 'package:flutter_todo/models/Exercise.dart';
import 'package:flutter_todo/models/sets.dart';


class Workout {
  String id;
  String name;
  List<Sets> exercises;

  Workout({
    @required this.id,
    @required this.name,
    this.exercises,
  });

   Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "exercises": exercises,
    };


  factory Workout.fromJson(Map<String, dynamic> json) => new Workout(
        id: json["id"],
        name: json["name"],
        exercises: json["exercises"], 
    );


    get sets{
      return Sets;
    }
}