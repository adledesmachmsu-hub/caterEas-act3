import 'package:flutter/material.dart';
import '../models/parking_space.dart';
import '../widgets/parking_card.dart';
import '../services/parking_service.dart';

class ParkingGridView extends StatefulWidget {
  @override
  _ParkingGridViewState createState() => _ParkingGridViewState();
}

class _ParkingGridViewState extends State<ParkingGridView> {
  final ParkingService _parkingService = ParkingService();
  List<ParkingSpace> _parkingSpaces = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadParkingSpaces();
  }

  Future<void> _loadParkingSpaces() async {
    try {
      // using correct method name from ParkingService
      final spaces = await ParkingService.getParkingSpaces();
      setState(() {
        _parkingSpaces = spaces;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load parking spaces: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Grid View'),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _parkingSpaces.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_parking, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No parking spaces available',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _parkingSpaces.length,
                    itemBuilder: (context, index) {
                      // removed onBook parameter and added GestureDetector for tap handling
                      return GestureDetector(
                        onTap: () => _bookParkingSpace(_parkingSpaces[index]),
                        child: ParkingCard(
                          parkingSpace: _parkingSpaces[index],
                        ),
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadParkingSpaces,
        child: Icon(Icons.refresh),
        tooltip: 'Refresh',
      ),
    );
  }

  void _bookParkingSpace(ParkingSpace space) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book Parking Space'),
          content: Text('Do you want to book "${space.name}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _confirmBooking(space);
              },
              child: Text('Book'),
            ),
          ],
        );
      },
    );
  }

  void _confirmBooking(ParkingSpace space) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking confirmed for ${space.name}'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
