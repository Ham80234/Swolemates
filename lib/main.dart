import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/workout/goals.dart';
import 'package:flutter_todo/pages/workout/import.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/pages/register/register_page.dart';
import 'package:flutter_todo/pages/settings/settings_page.dart';
import 'package:flutter_todo/pages/profile/profile_page.dart';
import 'package:flutter_todo/pages/auth/auth_page.dart';
import 'package:flutter_todo/pages/workout/todo_editor_page.dart';
import 'package:flutter_todo/pages/workout/workout.dart';

import 'package:flutter_todo/.env.example.dart';

void main() async {
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoAppState();
  }
}

class _TodoAppState extends State<TodoApp> {
  AppModel _model;
  bool _isAuthenticated = false;
  bool _isDarkThemeUsed = true;

  @override
  void initState() {
    _model = AppModel();

    _model.loadSettings();
    _model.autoAuthentication();

    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    });

    _model.themeSubject.listen((bool isDarkThemeUsed) {
      setState(() {
        _isDarkThemeUsed = isDarkThemeUsed;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: _model,
      child: MaterialApp(
        title: Configure.AppName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.blue,
          brightness: Brightness.dark, //_isDarkThemeUsed ? Brightness.dark : Brightness.light,
        ),
        routes: {
          '/': (BuildContext context) =>
              _isAuthenticated ? WorkoutPage(_model) : AuthPage(),
          '/editor': (BuildContext context) =>
              _isAuthenticated ? TodoEditorPage() : AuthPage(),
          '/register': (BuildContext context) =>
              _isAuthenticated ? WorkoutPage(_model) : RegisterPage(),
          '/settings': (BuildContext context) =>
              _isAuthenticated ? SettingsPage(_model) : AuthPage(),
          '/profile': (BuildContext context) =>
              _isAuthenticated ? ProfilePage(_model) : AuthPage(),
          '/goals' : (BuildContext context) =>
              _isAuthenticated ? GoalsPage(_model) : AuthPage(),
          '/import' : (BuildContext context) =>
              _isAuthenticated ? ImportPage(_model) : AuthPage(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                _isAuthenticated ? WorkoutPage(_model) : AuthPage(),
          );
        },
      ),
    );
  }
}
