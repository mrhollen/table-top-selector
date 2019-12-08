import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color-pallet.dart';

class BottomNav extends StatefulWidget {
  BottomNav({this.callback}) : super();

  final Function(int) callback;

  @override
  _BottomNavState createState() => _BottomNavState(callback: callback);
}

class _BottomNavState extends State<BottomNav> {
  _BottomNavState({this.parent, this.callback});

  final StatefulWidget parent;
  final Function(int) callback;

  int index = 0;

  void _navButtonTapped(int i) {
    setState(() {
      this.index = i;
    });

    switch(this.index) {
      case 0:
        callback(this.index);
        break;
      case 1:
        callback(this.index);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Choose"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          title: Text("Edit"),
        )
      ],
      currentIndex: index,
      selectedItemColor: ColorPallet.primary,
      onTap: _navButtonTapped,
    );
  }
}