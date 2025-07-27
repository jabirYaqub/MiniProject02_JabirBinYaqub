import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../screens/category_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.store,
                      size: 40,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'StyleKart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fashion for Everyone',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.man,
                  title: 'Men',
                  onTap: () => _navigateToCategory(context, 'Men'),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.woman,
                  title: 'Women',
                  onTap: () => _navigateToCategory(context, 'Women'),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.child_care,
                  title: 'Kids',
                  onTap: () => _navigateToCategory(context, 'Kids'),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.sports_basketball,
                  title: 'Shoes',
                  onTap: () => _navigateToCategory(context, 'Shoes'),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.watch,
                  title: 'Accessories',
                  onTap: () => _navigateToCategory(context, 'Accessories'),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.ac_unit,
                  title: 'Winter Collection',
                  onTap: () => _navigateToCategory(context, 'Winter Collection'),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.fitness_center,
                  title: 'Activewear',
                  onTap: () => _navigateToCategory(context, 'Activewear'),
                ),
                Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.shopping_cart,
                  title: 'Cart',
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to cart screen
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to profile screen
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    Navigator.pop(context);
                    // Handle logout
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade600),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.blue.shade50,
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(category: category),
      ),
    );
  }
}

