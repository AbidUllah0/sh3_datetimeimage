import 'package:flutter/material.dart';

class DatePickerClass extends StatefulWidget {
  const DatePickerClass({super.key});

  @override
  State<DatePickerClass> createState() => _DatePickerClassState();
}

class _DatePickerClassState extends State<DatePickerClass> {
  DateTime? _date;

  Future getDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
    );
    if (picked == null) {
      return;
    } else {
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('DATE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Before Selected Date : ${DateTime.now()}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                getDate();
              },
              child: Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.limeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              //_date.toString(),
              _date != null
                  ? 'The Date Is : ${_date?.day} - ${_date?.month} - ${_date?.year}'
                  : 'Yet Not Selected',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class DatePickerClass extends StatefulWidget {
//   const DatePickerClass({super.key});
//
//   @override
//   State<DatePickerClass> createState() => _DatePickerClassState();
// }
//
// class _DatePickerClassState extends State<DatePickerClass> {
//   DateTime? date=DateTime.now();
//
//   //or DateTime? date ;
//
//   Future getDate() async {
//
//     //userpicked from keyboard
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2021),
//       lastDate: DateTime(2024),
//     );
//     if (picked == null) {
//       return ;
//     } else {
//       setState(() {
//         date = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             date.toString(),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               getDate();
//             },
//             child: Text('Change Date'),
//           ),
//         ],
//       ),
//     );
//   }
// }
