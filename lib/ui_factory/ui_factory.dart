import 'package:flutter/material.dart';

class UIFactory {
  /*
  This class is used to store any function that is somehow linked
  to UI building. This is a singleton since we will use it everywhere.
  */

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('Rock, Paper, Scissors !'),
    );
  }
}
