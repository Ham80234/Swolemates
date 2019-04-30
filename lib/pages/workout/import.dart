import 'package:flutter/material.dart';
import 'package:flutter_todo/database/databasehandler.dart';
import 'package:flutter_todo/widgets/todo/importview.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_todo/.env.example.dart';
import 'package:flutter_todo/models/filter.dart';
import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/widgets/helpers/confirm_dialog.dart';
import 'package:flutter_todo/widgets/ui_elements/loading_modal.dart';
import 'package:flutter_todo/widgets/todo/shortcuts_enabled_todo_fab.dart';
import 'package:flutter_todo/pages/workout/exerciselist.dart';

class ImportPage extends StatefulWidget {
  final AppModel model;

  ImportPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ImportPageState();
  }
}

class _ImportPageState extends State<ImportPage> {
  @override
  void initState() {
    widget.model.fetchTodos();

    super.initState();
  }

  Widget _buildAppBar(AppModel model) {
    return AppBar(
      title: Text(Configure.AppName),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.lock),
          onPressed: () async {
            bool confirm = await ConfirmDialog.show(context);

            if (confirm == true) {
              model.logout();
            }
          },
        ),
        PopupMenuButton<String>(
          onSelected: (String choice) {
            switch (choice) {
              case 'Settings':
                Navigator.pushNamed(context, '/settings');
            }
            switch (choice) {
              case 'Profile':
                Navigator.pushNamed(context, '/profile');
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
               PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              )
            ];
          },
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton(AppModel model) {
    if (model.settings.isShortcutsEnabled) {
      return ShortcutsEnabledTodoFab(model);
    } else {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          model.setCurrentTodo(null);
         // DBProvider.getDatabase();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExpandableListView()),
            );
        },
      );
    }
  }

  Widget _buildAllFlatButton(AppModel model) {
    return FlatButton(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.fitness_center,
              color: model.filter == Filter.Workout ? Colors.white : Colors.black,
            ),
            Text(
              'Workout',
              style: TextStyle(
                color: model.filter == Filter.Workout ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        model.applyFilter(Filter.Workout);
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      },
    );
  }

  Widget _buildDoneFlatButton(AppModel model) {
    return FlatButton(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.show_chart,
              color: model.filter == Filter.Progress ? Colors.white : Colors.black,
            ),
            Text(
              'Progress',
              style: TextStyle(
                color:
                    model.filter == Filter.Progress ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        model.applyFilter(Filter.Progress);
        Navigator.pushNamed(context, '/goals');
      },
    );
  }

  Widget _buildNotDoneFlatButton(AppModel model) {
    return FlatButton(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.file_download,
              color:
                  model.filter == Filter.Goals ? Colors.white : Colors.black,
            ),
            Text(
              'Import',
              style: TextStyle(
                color: model.filter == Filter.Goals
                    ? Colors.white
                    : Colors.black,
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        model.applyFilter(Filter.Goals);
      },
    );
  }

  Widget _buildBottomAppBar(AppModel model) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // SizedBox(),
          _buildAllFlatButton(model),
          _buildDoneFlatButton(model),
          _buildNotDoneFlatButton(model),
          // SizedBox(
          //   width: 80.0,
          // ),
        ],
      ),
      color: Colors.blue,
      shape: CircularNotchedRectangle(),
    );
  }

  Widget _buildPageContent(AppModel model) {
    return Scaffold(
      appBar: _buildAppBar(model),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _buildFloatingActionButton(model),
      bottomNavigationBar: _buildBottomAppBar(model),
      body: ImportView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (BuildContext context, Widget child, AppModel model) {
        Stack stack = Stack(
          children: <Widget>[
            _buildPageContent(model),
          ],
        );

        if (model.isLoading) {
          stack.children.add(LoadingModal());
        }

        return stack;
      },
    );
  }
}
