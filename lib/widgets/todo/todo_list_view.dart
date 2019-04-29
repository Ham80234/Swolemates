import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/models/Exercise.dart';
import 'package:flutter_todo/models/filter.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/todo/todo_card.dart';

class TodoListView extends StatelessWidget {
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
        emptyText = 'The import feature is not available yet :('
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

  // @override
  // Widget build(BuildContext context) {
  //   return ScopedModelDescendant<AppModel>(
  //     builder: (BuildContext context, Widget child, AppModel model) {
  //       Widget todoCards = model.todos.length > 0
  //           ? _buildListView(model)
  //           : _buildEmptyText(model);

  //       return todoCards;
  //     },
  //   );
  // }

  static List<ListTile> exercises = new List<ListTile>();
  static int count = 0;
  static void addNewExercise(Exercise exercise, String weight, String reps){
    ListTile temp = new ListTile(
      title: Text(exercise.name),
      subtitle: Text(weight + ' lbs x ' + reps),
      trailing: Icon(Icons.edit),
      onTap: (){
        print('edit options');
        //  showDialog(
        //    context: context,
        //    builder: (BuildContext context) => _editExercise(context, exercise, weight, reps),);  
      }
    );
    exercises.add(temp);
    count++;
  }
  static void deleteExercise(BuildContext context, Exercise exercise){
    for(int i=0; i<exercises.length; i++){
      ListTile temp = exercises.elementAt(i);

    }

  }
  static TextEditingController weightController = new TextEditingController();
  static TextEditingController repsController = new TextEditingController();

  static Widget _editExercise(BuildContext context, Exercise exercise, String weight, String reps) {
    String exerciseName = exercise.name;
    return new AlertDialog(
      
      title: Text(exerciseName),
      content: new Column(
       mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("Weight:"),
          new TextField(
            controller: weightController,
            maxLines: 1,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: weight
            ),
          ),
          new Text("x"),
          new Text(""),
          new Text("Reps:"),
          new TextField(
            controller: repsController,
            maxLines: 1,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: reps
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
            TodoListView.addNewExercise(exercise, weightController.text, repsController.text);
          },
          textColor: Theme.of(context).accentColor,
          child: const Text('Delete Set'),
        ),
        new FlatButton(
          onPressed: () {
            //Navigator.of(context).pop();
            _showDialog(context);
            TodoListView.addNewExercise(exercise, weightController.text, repsController.text);
          },
          textColor: Theme.of(context).accentColor,
          child: const Text('Edit Set'),
        ),
      ],
    );
  }
  static void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(""),
          content: new Text("Set has been modified successfully!"),
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
  void resetExercises(){
    exercises = new List<ListTile>();
  }

  static List<ListTile> getExercises(){
    return exercises;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: exercises,
    );

    
  }
}
