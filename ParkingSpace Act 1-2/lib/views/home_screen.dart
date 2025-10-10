import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parkingspace/widgets/custom_button.dart';

// Task 6: App with navigation using Drawer
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isMaterialDesign = true;

  final List<Widget> _pages = [
    _HomeContent(),
    _SearchContent(),
    _ProfileContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Task 5: Material Design and Cupertino Widgets for same UI
    if (_isMaterialDesign) {
      return _buildMaterialDesign();
    } else {
      return _buildCupertinoDesign();
    }
  }

  Widget _buildMaterialDesign() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Space Finder'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.phone_iphone),
            onPressed: () {
              setState(() {
                _isMaterialDesign = false;
              });
            },
            tooltip: 'Switch to iOS Design',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.local_parking, size: 30, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Parking Finder',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Find your perfect spot',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.local_parking),
              title: Text('Find Parking'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/parking-list');
              },
            ),
            ListTile(
              leading: Icon(Icons.waving_hand),
              title: Text('Hello World'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/hello-world');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Counter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/counter');
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCupertinoDesign() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Parking Finder'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.device_phone_portrait),
              onPressed: () {
                setState(() {
                  _isMaterialDesign = true;
                });
              },
            ),
          ),
          child: SafeArea(
            child: _pages[index],
          ),
        );
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Parking Space Finder',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(
                    Icons.local_parking,
                    size: 64,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Find the perfect parking spot near you',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  // Task 4: Using custom reusable button widget
                  CustomButton(
                    text: 'Find Parking Now',
                    icon: Icons.search,
                    onPressed: () {
                      Navigator.pushNamed(context, '/parking-list');
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Hello World',
                  backgroundColor: Colors.green,
                  onPressed: () {
                    Navigator.pushNamed(context, '/hello-world');
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: 'Counter',
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, '/counter');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for parking spots...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Text(
                'Enter a location to search for parking',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
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
            'Aj Ledesma',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ajledesma@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 32),
          CustomButton(
            text: 'Edit Profile',
            icon: Icons.edit,
            onPressed: () {
              // Profile editing functionality
            },
          ),
        ],
      ),
    );
  }
}
