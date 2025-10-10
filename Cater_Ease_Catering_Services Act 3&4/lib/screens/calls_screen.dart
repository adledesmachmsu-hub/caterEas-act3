import 'package:flutter/material.dart';
import 'dart:math' as math;

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  final List<CallItem> _calls = [
    CallItem(
      name: 'Sarah Johnson',
      time: 'Today, 10:30 AM',
      duration: '15:23',
      type: CallType.incoming,
      icon: Icons.person,
      color: Colors.blue,
    ),
    CallItem(
      name: 'Mike Chen',
      time: 'Today, 9:15 AM',
      duration: '8:45',
      type: CallType.outgoing,
      icon: Icons.person_outline,
      color: Colors.green,
    ),
    CallItem(
      name: 'Emily Davis',
      time: 'Yesterday, 6:20 PM',
      duration: '22:10',
      type: CallType.incoming,
      icon: Icons.person_2,
      color: Colors.purple,
    ),
    CallItem(
      name: 'John Smith',
      time: 'Yesterday, 2:45 PM',
      duration: '5:30',
      type: CallType.missed,
      icon: Icons.person_3,
      color: Colors.red,
    ),
    CallItem(
      name: 'CaterEase Support',
      time: '2 days ago',
      duration: '12:15',
      type: CallType.outgoing,
      icon: Icons.support_agent,
      color: Colors.orange,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calls',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF6B35),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFF6B35).withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            // 3D Wave Animation Header
            _build3DWaveHeader(),
            // Calls List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _calls.length,
                itemBuilder: (context, index) {
                  return _build3DCallTile(_calls[index], index);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _build3DFloatingButton(),
    );
  }

  Widget _build3DWaveHeader() {
    return Container(
      height: 120,
      child: AnimatedBuilder(
        animation: _waveController,
        builder: (context, child) {
          return CustomPaint(
            painter: WavePainter(_waveController.value),
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..scale(1.0 +
                      math.sin(_waveController.value * 2 * math.pi) * 0.1),
                child: const Icon(
                  Icons.phone_in_talk,
                  size: 50,
                  color: Color(0xFFFF6B35),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _build3DCallTile(CallItem call, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 600 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(0.0, 50 * (1 - value), 0.0)
            ..rotateX((1 - value) * 0.3),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: call.color.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    _showCallDetail(call);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // 3D Avatar
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                call.color.withOpacity(0.8),
                                call.color,
                              ],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: call.color.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            call.icon,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Call info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                call.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    _getCallIcon(call.type),
                                    size: 16,
                                    color: _getCallColor(call.type),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    call.time,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Duration and call button
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              call.duration,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B35).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.phone,
                                size: 20,
                                color: Color(0xFFFF6B35),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _build3DFloatingButton() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Make a call')),
              );
            },
            backgroundColor: const Color(0xFFFF6B35),
            child: const Icon(Icons.add_call),
          ),
        );
      },
    );
  }

  IconData _getCallIcon(CallType type) {
    switch (type) {
      case CallType.incoming:
        return Icons.call_received;
      case CallType.outgoing:
        return Icons.call_made;
      case CallType.missed:
        return Icons.call_missed;
    }
  }

  Color _getCallColor(CallType type) {
    switch (type) {
      case CallType.incoming:
        return Colors.green;
      case CallType.outgoing:
        return Colors.blue;
      case CallType.missed:
        return Colors.red;
    }
  }

  void _showCallDetail(CallItem call) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [call.color.withOpacity(0.8), call.color],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(call.icon, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                call.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '${call.time} • ${call.duration}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.phone, 'Call', Colors.green),
                  _buildActionButton(Icons.message, 'Message', Colors.blue),
                  _buildActionButton(Icons.videocam, 'Video', Colors.purple),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class CallItem {
  final String name;
  final String time;
  final String duration;
  final CallType type;
  final IconData icon;
  final Color color;

  CallItem({
    required this.name,
    required this.time,
    required this.duration,
    required this.type,
    required this.icon,
    required this.color,
  });
}

enum CallType { incoming, outgoing, missed }

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF6B35).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.5);

    for (double i = 0; i < size.width; i++) {
      path.lineTo(
        i,
        size.height * 0.5 +
            math.sin((i / size.width * 4 * math.pi) +
                    (animationValue * 2 * math.pi)) *
                20,
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}
