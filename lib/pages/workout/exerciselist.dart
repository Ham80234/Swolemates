import 'package:flutter/material.dart';


import 'package:flutter_todo/database/databasehandler.dart';
import 'package:flutter_todo/database/listhandler.dart';
import 'package:flutter_todo/models/Exercise.dart';
import 'package:flutter/material.dart';

class ExpandableListView extends StatelessWidget {
  static final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
  ];
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
  
  static final List<String> groups = [
    "Chest",
    "Back",
    "Shoulders",
    "Biceps",
    "Triceps",
    "Traps",
    "Forearms",
    "Core/Abs",
    "Glutes",
    "Quads",
    "Hamstrings",
    "Calves",
    "Cardio",
    "Full body",
    "Other",
  ];
  static final List<List<Exercise>> exercises = [
      chestExercises, //1
      backExercises,
      shoulderExercises,
      bicepsExercises,
      tricepsExercises, //5
      trapExercises,
      forearmsExercises, 
      coreExercises,
      glutesExercises,
      quadExercises, //10
      hamstringExercises, 
      calfExercises,
      cardioExercises,
      fullbodyExercises, 
      otherExercises, //15
  ];


  @override
  Widget build(BuildContext context) {
    List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(

      15,
      (i) => ExpansionTile(
            title: Text(groups.elementAt(i)),
            children: exercises.elementAt(i)
                .map((data) => ListTile(
                
                      leading: Text(data.id.toString()),
                      title: Text(data.name),
                      onTap: (){
                        print("Navigate");
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildAboutDialog(context, data),);     
                      }
                    ))
                .toList(),
          ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children:
            _listOfExpansions.map((expansionTile) => expansionTile).toList(),
      ),
    );
  }


  static void navigateAccordingly(String title){
    print("navigate" + title);

    

    
  }

Widget _buildAboutDialog(BuildContext context, Exercise exercise) {
    String exerciseName = exercise.name;
    return new AlertDialog(
      
      title: Text(exerciseName),
      content: new Column(
       mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("Weight:"),
          new TextField(
            maxLines: 1,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Please enter the weight'
            ),
          ),
          new Text("x"),
          new Text(""),
          new Text("Reps:"),
          new TextField(
            maxLines: 1,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Please enter the reps'
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).accentColor,
          child: const Text('Close'),
        ),
        new FlatButton(
          onPressed: () {
            //Navigator.of(context).pop();
            _showDialog(context);
          },
          textColor: Theme.of(context).accentColor,
          child: const Text('Add Set'),
        ),
      ],
    );
  }
  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(""),
          content: new Text("Set has been added successfully!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

