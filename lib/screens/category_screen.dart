import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/product_service.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    final productService = Provider.of<ProductService>(context, listen: false);
    setState(() {
      products = productService.getProductsByCategory(widget.category);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : products.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16),
            Text(
              'No products found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Check back later for new arrivals',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      )
          : Column(
        children: [
          // Category Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border(
                bottom: BorderSide(
                  color: Colors.blue.shade100,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${products.length} Products',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade700,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.filter_list,
                      size: 20,
                      color: Colors.blue.shade600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Products Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onTap: () {
                      _showProductDetails(context, products[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Product Image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 60,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Product Name
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Product Category
                  Text(
                    product.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 16),

                  // Product Price
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Product Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 30),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

