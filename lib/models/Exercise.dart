import 'package:flutter/material.dart';


class Exercise {
  final String id;
  final String name;
  final int type;
  final int pref;
  final int suf;
  final String userId;

  Exercise({
    @required this.id,
    @required this.name,
    this.type,
    this.pref,
    this.suf,
    @required this.userId,
  });
}
