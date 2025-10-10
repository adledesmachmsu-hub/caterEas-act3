import 'package:flutter/material.dart';
import 'booking_form_screen.dart';

class BookingsListScreen extends StatefulWidget {
  const BookingsListScreen({super.key});

  @override
  State<BookingsListScreen> createState() => _BookingsListScreenState();
}

class _BookingsListScreenState extends State<BookingsListScreen> {
  final List<Map<String, dynamic>> _bookings = [];

  void _addNewBooking() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BookingFormScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        _bookings.add(result);
      });
    }
  }

  void _deleteBooking(int index) {
    setState(() {
      _bookings.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Booking deleted'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        elevation: 0,
      ),
      body: _bookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_busy,
                    size: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No bookings yet',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tap the + button to create your first booking',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _bookings.length,
              itemBuilder: (context, index) {
                final booking = _bookings[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                booking['name'] ?? 'Unknown',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteBooking(index),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        _buildInfoRow(
                          Icons.celebration,
                          'Event Type',
                          booking['cateringType'] ?? 'N/A',
                        ),
                        _buildInfoRow(
                          Icons.restaurant,
                          'Meal Type',
                          booking['mealType'] ?? 'N/A',
                        ),
                        _buildInfoRow(
                          Icons.people,
                          'Guests',
                          booking['guests'] ?? 'N/A',
                        ),
                        _buildInfoRow(
                          Icons.calendar_today,
                          'Date',
                          booking['date'] != null
                              ? '${booking['date'].day}/${booking['date'].month}/${booking['date'].year}'
                              : 'N/A',
                        ),
                        _buildInfoRow(
                          Icons.access_time,
                          'Time',
                          booking['time'] != null
                              ? booking['time'].format(context)
                              : 'N/A',
                        ),
                        _buildInfoRow(
                          Icons.location_on,
                          'Location',
                          booking['address'] ?? 'N/A',
                        ),
                        _buildInfoRow(
                          Icons.phone,
                          'Phone',
                          booking['phone'] ?? 'N/A',
                        ),
                        if (booking['decorations'] == true ||
                            booking['waiters'] == true) ...[
                          const SizedBox(height: 8),
                          const Text(
                            'Additional Services:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (booking['decorations'] == true)
                            _buildChip('Decorations', Icons.auto_awesome),
                          if (booking['waiters'] == true)
                            _buildChip('Waiters', Icons.room_service),
                        ],
                        if (booking['notes'] != null &&
                            booking['notes'].toString().isNotEmpty) ...[
                          const SizedBox(height: 8),
                          const Text(
                            'Special Requests:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            booking['notes'],
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewBooking,
        backgroundColor: Theme.of(context).primaryColor,
        icon: const Icon(Icons.add),
        label: const Text('New Booking'),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 4),
      child: Chip(
        avatar: Icon(icon, size: 16),
        label: Text(label),
        backgroundColor: Colors.orange[50],
        labelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}
