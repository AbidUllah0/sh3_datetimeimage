import 'package:flutter/material.dart';
import 'package:sh3_datetimeimage/views/Date_Picker/date_picker.dart';
import 'package:sh3_datetimeimage/views/Image_Picker/image_picker.dart';
import 'package:sh3_datetimeimage/views/Time_Picker/time_picker.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _screens = [
    DatePickerClass(),
    TimePickerClass(),
    ImagePickerClass(),
  ];

  int _selectedIndex = 0;
  List navbarIcon = [
    Icons.date_range,
    Icons.timer_rounded,
    Icons.image_outlined
  ];
  List navbarText = [
    'DATE',
    'TIME',
    'IMAGE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.limeAccent,
        showSelectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex,
        backgroundColor: Colors.cyan,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              navbarIcon[0],
              size: 30,
              color: Colors.pink,
            ),
            label: 'DATE',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              navbarIcon[1],
              size: 30,
              color: Colors.pink,
            ),
            label: 'TIME',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              navbarIcon[2],
              size: 30,
              color: Colors.pink,
            ),
            label: 'Image',
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
