import 'package:flutter/material.dart';

class myBooking extends StatefulWidget {
  final String matricNo;
  final String date;
  final String time;
  final String duration;
  final String selectedCourt;

  myBooking({
    required this.matricNo,
    required this.date,
    required this.time,
    required this.duration,
    required this.selectedCourt,
  });

  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<myBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 175, 76),
        title: Text(
          'My Booking',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 800,
          height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Background4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(130.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Matric No: ${widget.matricNo}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Date: ${widget.date}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Time: ${widget.time}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Duration: ${widget.duration}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Court: ${widget.selectedCourt}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // Navigate to homeScreen
                  Navigator.pushNamed(
                    context,
                    '/',
                  );
                },
                child: Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
