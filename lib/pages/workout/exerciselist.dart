import 'package:flutter/material.dart';


import 'package:flutter_todo/.env.example.dart';
import 'package:flutter_todo/database/databasehandler.dart';
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
  static final List<Exercise> cchestExercises = [
      new Exercise(id: 0001.toString(), name:"Barbell bench press", type:0, pref:0, suf:0),
      new Exercise(id: 0002.toString(), name:"Incline barbell bench press", type:0, pref:0, suf:0),
      new Exercise(id: 0003.toString(), name:"Decline barbell bench press", type:1, pref:0, suf:0),
      new Exercise(id: 0004.toString(), name:"Dumbbell barbell bench press", type:1, pref:0, suf:0),
      new Exercise(id: 0005.toString(), name:"Dumbbell incline press", type:1, pref:0, suf:0),
      new Exercise(id: 0006.toString(), name:"Dumbbell decline press", type:1, pref:0, suf:0),
      new Exercise(id: 0007.toString(), name:"Pushup", type:1, pref:0, suf:0),
      new Exercise(id: 0008.toString(), name:"Close-grip pushup", type:1, pref:0, suf:0),
      new Exercise(id: 0009.toString(), name:"Close-grip bench press", type:1, pref:0, suf:0),
      new Exercise(id: 0010.toString(), name:"Dumbbell fly", type:1, pref:0, suf:0),
      new Exercise(id: 0011.toString(), name:"Incline dumbbell fly", type:1, pref:0, suf:0),
      new Exercise(id: 0012.toString(), name:"Cable fly", type:1, pref:0, suf:0),
      new Exercise(id: 0013.toString(), name:"High cable fly", type:1, pref:0, suf:0),
      new Exercise(id: 0014.toString(), name:"Low cable fly", type:1, pref:0, suf:0),
      new Exercise(id: 0015.toString(), name:"Machine fly", type:1, pref:0, suf:0),
      new Exercise(id: 0016.toString(), name:"Dips", type:1, pref:0, suf:0),
      new Exercise(id: 0017.toString(), name:"Machine press", type:1, pref:0, suf:0),
  ];
  static final List<Exercise> chestExercises = DBProvider.getAllExercisesPerGroup("Chest");
  static final List<Exercise> backExercises = [
      new Exercise(id: 0101.toString(), name:"Pullup", type:0, pref:0, suf:0),
      new Exercise(id: 0102.toString(), name:"Chinup", type:0, pref:0, suf:0),
      new Exercise(id: 0103.toString(), name:"Overhand barbell row", type:0, pref:0, suf:0),
      new Exercise(id: 0104.toString(), name:"Underhand barbell row", type:1, pref:0, suf:0),
  ];
  static final List<Exercise> shoulderExercises = [
      new Exercise(id: 0201.toString(), name:"Barbell OHP", type:0, pref:0, suf:0),
      new Exercise(id: 0202.toString(), name:"Barbell push press", type:0, pref:0, suf:0),
      new Exercise(id: 0203.toString(), name:"Dumbbell OHP", type:1, pref:0, suf:0),
      new Exercise(id: 0204.toString(), name:"Dumbbell push press", type:1, pref:0, suf:0),
  ];
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
      chestExercises,
      chestExercises, //5
      chestExercises, 
      chestExercises,
      chestExercises,
      chestExercises,
      chestExercises, //10
      chestExercises, 
      chestExercises,
      chestExercises,
      chestExercises, 
      chestExercises, //15
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

