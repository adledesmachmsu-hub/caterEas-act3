import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Our Menu'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          // Activity #9: TabBar inside an AppBar
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.restaurant), text: 'Appetizers'),
              Tab(icon: Icon(Icons.set_meal), text: 'Main Course'),
              Tab(icon: Icon(Icons.cake), text: 'Desserts'),
            ],
          ),
        ),
        // Activity #4: TabBarView that switches between screens
        body: const TabBarView(
          children: [
            AppetizersTab(),
            MainCourseTab(),
            DessertsTab(),
          ],
        ),
      ),
    );
  }
}

class AppetizersTab extends StatelessWidget {
  const AppetizersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMenuItem(
          'Spring Rolls',
          'Crispy vegetable spring rolls with sweet chili sauce',
          '\₱450',
          Icons.restaurant,
        ),
        _buildMenuItem(
          'Bruschetta',
          'Toasted bread with tomatoes, garlic, and basil',
          '\₱369',
          Icons.restaurant,
        ),
        _buildMenuItem(
          'Chicken Wings',
          'Spicy buffalo wings with ranch dressing',
          '\₱299',
          Icons.restaurant,
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      String name, String description, String price, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, color: Colors.orange),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(
          price,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class MainCourseTab extends StatelessWidget {
  const MainCourseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMenuItem(
          'Grilled Salmon',
          'Fresh Atlantic salmon with lemon butter sauce',
          '\₱459',
          Icons.set_meal,
        ),
        _buildMenuItem(
          'Beef Steak',
          'Premium ribeye steak with garlic mashed potatoes',
          '\₱430',
          Icons.set_meal,
        ),
        _buildMenuItem(
          'Pasta Carbonara',
          'Creamy pasta with bacon and parmesan',
          '\₱459',
          Icons.set_meal,
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      String name, String description, String price, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, color: Colors.orange),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(
          price,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class DessertsTab extends StatelessWidget {
  const DessertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMenuItem(
          'Chocolate Cake',
          'Rich chocolate layer cake with ganache',
          '\₱399',
          Icons.cake,
        ),
        _buildMenuItem(
          'Tiramisu',
          'Classic Italian coffee-flavored dessert',
          '\₱149',
          Icons.cake,
        ),
        _buildMenuItem(
          'Ice Cream Sundae',
          'Three scoops with toppings of your choice',
          '\₱599',
          Icons.cake,
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      String name, String description, String price, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, color: Color(0xff080500)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(
          price,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
