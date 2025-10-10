import 'package:flutter/material.dart';
import '../models/parking_space.dart';
import '../services/parking_service.dart';
import '../widgets/parking_card.dart';

class ParkingListView extends StatefulWidget {
  @override
  _ParkingListViewState createState() => _ParkingListViewState();
}

class _ParkingListViewState extends State<ParkingListView> {
  List<ParkingSpace> parkingSpaces = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadParkingSpaces();
  }

  void loadParkingSpaces() async {
    final spaces = await ParkingService.getParkingSpaces();
    setState(() {
      parkingSpaces = spaces;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Parking'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: parkingSpaces.length,
              itemBuilder: (context, index) {
                return ParkingCard(parkingSpace: parkingSpaces[index]);
              },
            ),
    );
  }
}
