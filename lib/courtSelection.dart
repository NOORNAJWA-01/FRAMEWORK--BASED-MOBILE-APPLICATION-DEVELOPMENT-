import 'package:flutter/material.dart';
import 'package:project1/homeScreen.dart';
import 'package:project1/main.dart';
import 'package:project1/bookingDetails.dart';
import 'package:project1/myBooking.dart';

class courtSelection extends StatefulWidget {
  final String matricNo;
  final String date;
  final String time;
  final String duration;

  courtSelection({
    required this.matricNo,
    required this.date,
    required this.time,
    required this.duration,
  });

  @override
  _courtSelectionState createState() => _courtSelectionState();
}

class _courtSelectionState extends State<courtSelection> {
  String selectedCourt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 175, 76),
        title: Text(
          'Court Selection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Background3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Select a badminton court:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            RadioListTile(
              title: Text(
                'Court A',
                style: TextStyle(
                  color:
                      selectedCourt == 'Court A' ? Colors.green : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.green,
              value: 'Court A',
              groupValue: selectedCourt,
              onChanged: (value) {
                setState(() {
                  selectedCourt = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                'Court B',
                style: TextStyle(
                  color:
                      selectedCourt == 'Court B' ? Colors.green : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.green,
              value: 'Court B',
              groupValue: selectedCourt,
              onChanged: (value) {
                setState(() {
                  selectedCourt = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                'Court C',
                style: TextStyle(
                  color:
                      selectedCourt == 'Court C' ? Colors.green : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.green,
              value: 'Court C',
              groupValue: selectedCourt,
              onChanged: (value) {
                setState(() {
                  selectedCourt = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                'Court D',
                style: TextStyle(
                  color:
                      selectedCourt == 'Court D' ? Colors.green : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.green,
              value: 'Court D',
              groupValue: selectedCourt,
              onChanged: (value) {
                setState(() {
                  selectedCourt = value.toString();
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
                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    },
                    child: Text('Back'),
                  ),
                  const SizedBox(height: 10), // space between buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Show confirmation dialog
                      _showBookingConfirmationDialog(context);
                    },
                    child: Text('Book'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingConfirmationDialog(BuildContext context) {
    if (widget.matricNo.isEmpty ||
        widget.date.isEmpty ||
        widget.time.isEmpty ||
        widget.duration.isEmpty ||
        selectedCourt.isEmpty) {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter all details before booking."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Close the error dialog
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Show the booking confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Booking Confirmation"),
            content: Text(
              "Matric No: ${widget.matricNo}\nDate: ${widget.date}\nTime: ${widget.time}\nDuration: ${widget.duration}\nCourt: $selectedCourt",
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Close the confirmation dialog
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to myBook screen and pass the data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myBooking(
                        matricNo: widget.matricNo,
                        date: widget.date,
                        time: widget.time,
                        duration: widget.duration,
                        selectedCourt: selectedCourt,
                      ),
                    ),
                  );
                },
                child: Text("Confirm"),
              ),
            ],
          );
        },
      );
    }
  }
}
