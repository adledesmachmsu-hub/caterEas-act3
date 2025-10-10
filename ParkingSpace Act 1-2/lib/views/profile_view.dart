import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

// Task 3: StatefulWidget with counter functionality
class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Profile Views: $_counter',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                text: 'Increment',
                icon: Icons.add,
                onPressed: _incrementCounter,
              ),
              CustomButton(
                text: 'Decrement',
                icon: Icons.remove,
                backgroundColor: Colors.red,
                onPressed: _decrementCounter,
              ),
            ],
          ),
          SizedBox(height: 32),
          CustomButton(
            text: 'Edit Profile',
            icon: Icons.edit,
            backgroundColor: Colors.green,
            onPressed: () {
              // Profile editing functionality
            },
          ),
        ],
      ),
    );
  }
}
