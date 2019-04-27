import 'package:flutter/material.dart';


import 'package:flutter_todo/.env.example.dart';
import 'package:flutter_todo/database/databasehandler.dart';
import 'package:flutter_todo/database/listhandler.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/models/priority.dart';
import 'package:flutter_todo/pages/workout/exerciseinfo.dart';
import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/widgets/helpers/message_dialog.dart';
import 'package:flutter_todo/widgets/helpers/confirm_dialog.dart';
import 'package:flutter_todo/widgets/ui_elements/loading_modal.dart';
import 'package:flutter_todo/widgets/form_fields/priority_form_field.dart';
import 'package:flutter_todo/widgets/form_fields/toggle_form_field.dart';
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

  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(

      15,
      (i) => ExpansionTile(
            title: Text(groups.elementAt(i)),
            children: exercises.elementAt(i)
                .map((data) => ListTile(
                
                      leading: Text(data.id.toString()),
                      title: Text(data.name),
                      onTap: (){
                        navigateAccordingly(data.id);

                         Card c = new Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
                         
          
                      }
                    ))
                .toList(),
          ));

  @override
  Widget build(BuildContext context) {
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

  Widget _buildPageContent(AppModel model) {
    return Scaffold(
     // appBar: _buildAppBar(model),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  static void navigateAccordingly(String title){
    print("navigate" + title);

    

    
  }

}

