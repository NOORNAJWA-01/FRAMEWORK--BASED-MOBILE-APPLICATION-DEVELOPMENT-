import 'package:flutter/material.dart';
import 'package:project1/homeScreen.dart';
import 'package:project1/courtSelection.dart';

class bookingDetails extends StatefulWidget {
  const bookingDetails({Key? key}) : super(key: key);

  @override
  _bookingDetailsState createState() => _bookingDetailsState();
}

class _bookingDetailsState extends State<bookingDetails> {
  TextEditingController matricno = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  String _selectedDuration = 'Select Duration'; // Default duration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 175, 76),
        title: Text(
          'Booking Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20), // space between text field
                  TextField(
                    controller: matricno,
                    decoration: InputDecoration(
                      labelText: "Matric No.",
                      hintText: "Enter your matric no.",
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      labelStyle:
                          const TextStyle(fontSize: 15, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // space between text field
                  TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Select Date",
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        size: 30,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  const SizedBox(height: 20), // space between text field
                  TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: "Select Time",
                      prefixIcon: Icon(
                        Icons.access_time,
                        size: 30,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                  const SizedBox(height: 20), // space between text field

                  // Dropdown button for duration
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Select Duration",
                      prefixIcon: Icon(
                        Icons.timer,
                        size: 30,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    value: _selectedDuration,
                    items: [
                      'Select Duration',
                      '1 hour',
                      '1.5 hours',
                      '2 hours',
                      // Add more durations as needed
                    ].map((duration) {
                      return DropdownMenuItem<String>(
                        value: duration,
                        child: Text(duration),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDuration = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 20), // space between buttons

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            // Navigate to Home Page

                            // Navigate to homeScreen
                            Navigator.pushNamed(
                              context,
                              '/',
                            );
                          },
                          child: Text("Home"),
                        ),
                        const SizedBox(height: 10), // space between buttons
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            // Navigate to Screen 2 and pass data
                            navigateTocourtSelection(context);
                          },
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  void navigateTocourtSelection(BuildContext context) {
    // Navigate to Screen 2 and pass data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => courtSelection(
          matricNo: matricno.text,
          date: _dateController.text,
          time: _timeController.text,
          duration: _selectedDuration,
        ),
      ),
    );
  }
}
