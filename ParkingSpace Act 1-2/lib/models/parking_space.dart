class ParkingSpace {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double pricePerHour;
  final bool isAvailable;
  final int totalSpaces;
  final int availableSpaces;

  ParkingSpace({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.pricePerHour,
    required this.isAvailable,
    required this.totalSpaces,
    required this.availableSpaces,
  });

  factory ParkingSpace.fromJson(Map<String, dynamic> json) {
    return ParkingSpace(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      pricePerHour: json['pricePerHour'],
      isAvailable: json['isAvailable'],
      totalSpaces: json['totalSpaces'],
      availableSpaces: json['availableSpaces'],
    );
  }
}
