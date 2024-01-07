import 'package:flutter/material.dart';
import 'package:project1/courtSelection.dart';
import 'bookingDetails.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Badminton Court Application ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          const SizedBox(
            height: 200.0,
            child: const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 96, 139, 128)),
              child: Text(
                'Badminton Court Booking',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Booking Details'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/first',
              );
            },
          ),
          ListTile(
            title: const Text('Court Selection'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/second',
              );
            },
          ),
          ListTile(
            title: const Text('My Booking'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/third',
              );
            },
          ),
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(2.0),
                child: Text(
                  'Welcome to Badminton Court UMT...!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Navigate to homeScreen
                  Navigator.pushNamed(
                    context,
                    '/first',
                  );
                },
                child: Text("Booking Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
