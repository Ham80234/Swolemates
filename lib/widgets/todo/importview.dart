import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/database/workouthandler.dart';
import 'package:flutter_todo/models/filter.dart';
import 'package:flutter_todo/models/sets.dart';
import 'package:flutter_todo/models/workout.dart';
import 'package:flutter_todo/widgets/todo/todo_list_view.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/todo/todo_card.dart';

class ImportView extends StatelessWidget {
  Widget _buildEmptyText(AppModel model) {
    String emptyText;

    switch (model.filter) {
      case Filter.Workout:
        emptyText = 'Press the + to add exercise';
        break;

      case Filter.Progress:
        emptyText = 'Complete exercises to view progress!'
            '';
        break;

      case Filter.Goals:
        emptyText = 'Uh oh! Something has broken!'
            '';
        break;
    }

    return Container(
      color: Color.fromARGB(16, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Text(
            emptyText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildListView(AppModel model) {
    return ListView.builder(
      itemCount: model.todos.length,
      itemBuilder: (BuildContext context, int index) {
        Todo todo = model.todos[index];

        return Dismissible(
          key: Key(todo.id),
          onDismissed: (DismissDirection direction) {
            model.removeTodo(todo.id);
          },
          child: TodoCard(todo),
          background: Container(color: Colors.red),
        );
      },
    );
  }
  static Workout pplPushDay = new Workout(id: '000', name: 'PPL Push Day', exercises: WorkoutHandler.getPPLExercise(0));
  
  static List<Workout> ppl = [
    pplPushDay = new Workout(id: '000', name: 'Push Day', exercises: WorkoutHandler.getPPLExercise(0)),
  ];
  static final List<String> workouts = [
    "Push Pull Legs - Metallicsdpas Variant",
  ];

  static final List<List<Workout>> workoutDays = [
      ppl,
  ];

  @override
  Widget build(BuildContext context) {
    List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(

      1,
      (i) => ExpansionTile(
            title: Text(workouts.elementAt(i)),
            children: workoutDays.elementAt(i)
                .map((data) => ListTile(
                
                      leading: Text(data.id.toString()),
                      title: Text(data.name),
                      onTap: (){
                        print("Navigate");  
                        for(int i=0; i<data.exercises.length; i++){
                          TodoListView.addNewEmptyExercise(data.exercises.elementAt(i).exercise, data.exercises.elementAt(i).rep.toString());
                        }
                        _showDialog(context);
                      }
                    ))
                .toList(),
          ));


    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
        actions: <Widget>[
        ]
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children:
            _listOfExpansions.map((expansionTile) => expansionTile).toList(),
      ),
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
          content: new Text("Workout has been imported successfully!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
            ),
          ],
        );
      },
    );
  }
}