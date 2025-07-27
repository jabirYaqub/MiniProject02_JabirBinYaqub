import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/product_service.dart';
import '../screens/category_screen.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final categories = productService.getCategories();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0, // Adjust this to control the circular card size relative to grid cell
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final categoryName = categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(category: categoryName),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the circular card
              shape: BoxShape.circle, // Makes the container circular
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getCategoryIcon(categoryName),
                  size: 50,
                  color: Colors.blue.shade600,
                ),
                SizedBox(height: 10),
                Text(
                  categoryName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName) {
      case 'Men':
        return Icons.man;
      case 'Women':
        return Icons.woman;
      case 'Kids':
        return Icons.child_care;
      case 'Shoes':
        return Icons.sports_basketball;
      case 'Accessories':
        return Icons.watch;
      case 'Winter Collection':
        return Icons.ac_unit;
      case 'Activewear':
        return Icons.fitness_center;
      default:
        return Icons.category;
    }
  }
}
