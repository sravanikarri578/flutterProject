import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  String _selectedDay = 'Monday';
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedActivity = 'Wake up';

  final List<String> _days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> _activities = ['Wake up', 'Go to gym', 'Breakfast', 'Meetings', 'Lunch', 'Quick nap', 'Go to library', 'Dinner', 'Go to sleep'];

  void _scheduleReminder() {
    // This method should contain logic to schedule a reminder based on user input.
    // For demo purposes, we'll play a sound immediately.
    FlutterRingtonePlayer.playRingtone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDay = newValue!;
                });
              },
              items: _days.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select Day'),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SfDateRangePicker(
                onSelectionChanged: (args) {
                  if (args.value is DateTime) {
                    final time = TimeOfDay.fromDateTime(args.value);
                    setState(() {
                      _selectedTime = time;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedActivity,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedActivity = newValue!;
                });
              },
              items: _activities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select Activity'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _scheduleReminder,
              child: Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}
name:dotdart