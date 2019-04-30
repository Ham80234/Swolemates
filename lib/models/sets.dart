import 'package:flutter/material.dart';
import 'package:flutter_todo/models/Exercise.dart';


class Sets {
  Exercise exercise;
  int rep;

  Sets({
    @required this.exercise,
    this.rep,
  });

  Map<String, dynamic> toJson() => {
        "exercise": exercise,
        "rep": rep,
    };


  factory Sets.fromJson(Map<String, dynamic> json) => new Sets(
        exercise: json["exercise"],
        rep: json["rep"], 
    );


    get sets{
      return Sets;
    }
}