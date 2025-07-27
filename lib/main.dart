import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/get_started_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/category_screen.dart';
import 'services/product_service.dart';
import 'models/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        Provider(create: (_) => ProductService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StyleKart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 1,
          ),
        ),
        home: GetStartedScreen(), // Set GetStartedScreen as the initial screen
        routes: {
          '/home': (context) => HomeScreen(),
          '/category': (context) => CategoryScreen(category: ''),
          '/signup': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
        },
      ),
    );
  }
}