// HANDLER FOR THE PPL WORKOUT

import 'package:flutter_todo/database/listhandler.dart';
import 'package:flutter_todo/models/Exercise.dart';
import 'package:flutter_todo/models/sets.dart';

class WorkoutHandler{
  static List<Exercise> chestExercises = ListHandler.getChestExercises();
  static List<Exercise> backExercises = ListHandler.getBackExercises();
  static List<Exercise> shoulderExercises = ListHandler.getShoulderExercises();
  static List<Exercise> trapExercises = ListHandler.getTrapExercises();
  static List<Exercise> bicepsExercises = ListHandler.getBicepsExercises();
  static List<Exercise> tricepsExercises = ListHandler.getTricepsExercises();
  static List<Exercise> forearmsExercises = ListHandler.getForearmExercises();
  static List<Exercise> coreExercises = ListHandler.getAbExercises();
  static List<Exercise> glutesExercises = ListHandler.getGluteExercises();
  static List<Exercise> quadExercises = ListHandler.getQuadExercises();
  static List<Exercise> hamstringExercises = ListHandler.getHamstringExercises();
  static List<Exercise> calfExercises = ListHandler.getCalfExercises();
  static List<Exercise> cardioExercises = ListHandler.getCardioExercises();
  static List<Exercise> fullbodyExercises = ListHandler.getFBExercises();
  static List<Exercise> otherExercises = ListHandler.getOtherExercises();

  static List<Sets> getPPLExercise(int day){
    List<Sets> temp = new List<Sets>();
    Sets tempSet;

    switch(day){
      case 0:{
        for(int i=0; i<5; i++){
          tempSet = new Sets(exercise: chestExercises.elementAt(0), rep: 4);
          temp.add(tempSet);
        }
        for(int i=0; i<5; i++){
          tempSet = new Sets(exercise: shoulderExercises.elementAt(0), rep: 8);
          temp.add(tempSet);
        }
        for(int i=0; i<4; i++){
          tempSet = new Sets(exercise: chestExercises.elementAt(4), rep: 12);
          temp.add(tempSet);
        }
        for(int i=0; i<4; i++){
          tempSet = new Sets(exercise: tricepsExercises.elementAt(4), rep: 12);
          temp.add(tempSet);
        }
        for(int i=0; i<4; i++){
          tempSet = new Sets(exercise: tricepsExercises.elementAt(6), rep: 12);
          temp.add(tempSet);
        }
        for(int i=0; i<4; i++){
          tempSet = new Sets(exercise: tricepsExercises.elementAt(8), rep: 12);
          temp.add(tempSet);
        }
      }


    }

    return temp;
  }
}