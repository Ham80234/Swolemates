import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Horse'),
          subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('horse');
          },
          selected: true,
        ),
        ListTile(
          title: Text('Cow'),
          subtitle: Text('Provider of milk'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('cow');
          },
        ),
        ListTile(
          title: Text('Camel'),
          subtitle: Text('Comes with humps'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('camel');
          },
          enabled: false,
        ),
        ListTile(
          title: Text('Sheep'),
          subtitle: Text('Provides wool'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('sheep');
          },
        ),
        ListTile(
          title: Text('Goat'),
          subtitle: Text('Some have horns'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('goat');
          },
        ),
      ],
    );
  }
}

/*Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Horse'),
          subtitle: Text('A strong animal'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('horse');
          },
          selected: true,
        ),
        ListTile(
          title: Text('Cow'),
          subtitle: Text('Provider of milk'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('cow');
          },
        ),
        ListTile(
          title: Text('Camel'),
          subtitle: Text('Comes with humps'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('camel');
          },
          enabled: false,
        ),
        ListTile(
          title: Text('Sheep'),
          subtitle: Text('Provides wool'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('sheep');
          },
        ),
        ListTile(
          title: Text('Goat'),
          subtitle: Text('Some have horns'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('goat');
          },
        ),
      ],
    );
  }
*/