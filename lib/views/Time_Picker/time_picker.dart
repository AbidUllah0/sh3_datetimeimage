
import 'package:flutter/material.dart';

class TimePickerClass extends StatefulWidget {
  const TimePickerClass({super.key});

  @override
  State<TimePickerClass> createState() => _TimePickerClassState();
}

class _TimePickerClassState extends State<TimePickerClass> {
  TimeOfDay? _timeOfDay;

  Future getTimeOfDay() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime == null) {
      return;
    } else {
      setState(() {
        _timeOfDay = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIME'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                getTimeOfDay();
              },
              child: Text('Select The Time'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              _timeOfDay != null
                  ? 'Date is ${_timeOfDay?.hour} - ${_timeOfDay?.minute} '
                  : "Time Yet Not Selected",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
