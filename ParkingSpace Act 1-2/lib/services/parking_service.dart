import '../models/parking_space.dart';

class ParkingService {
  static Future<List<ParkingSpace>> getParkingSpaces() async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // Mock data
    return [
      ParkingSpace(
        id: '1',
        name: 'Downtown Mall Parking',
        address: '123 Main St, Downtown',
        latitude: 40.7128,
        longitude: -74.0060,
        pricePerHour: 5.50,
        isAvailable: true,
        totalSpaces: 100,
        availableSpaces: 25,
      ),
      ParkingSpace(
        id: '2',
        name: 'City Center Garage',
        address: '456 Center Ave, City',
        latitude: 40.7589,
        longitude: -73.9851,
        pricePerHour: 8.00,
        isAvailable: true,
        totalSpaces: 200,
        availableSpaces: 45,
      ),
      ParkingSpace(
        id: '3',
        name: 'Airport Long-term',
        address: '789 Airport Rd, Terminal 1',
        latitude: 40.6892,
        longitude: -74.1745,
        pricePerHour: 3.25,
        isAvailable: false,
        totalSpaces: 500,
        availableSpaces: 0,
      ),
      ParkingSpace(
        id: '4',
        name: 'University Campus',
        address: '321 College St, Campus',
        latitude: 40.7505,
        longitude: -73.9934,
        pricePerHour: 2.75,
        isAvailable: true,
        totalSpaces: 150,
        availableSpaces: 78,
      ),
    ];
  }
}
