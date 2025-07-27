import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  // Example: A simple counter to demonstrate state management
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners(); // Notify widgets that are listening to AppState changes
  }

// You can add more state variables and methods here as your app grows.
// For example, managing user authentication status, shopping cart items, etc.
}
