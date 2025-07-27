import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background logo image (scaled nicely)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF2D0C5E), // Deep purple background
              image: DecorationImage(
                image: AssetImage('assets/images/logo_get_started.png'),
                fit: BoxFit.contain, // Prevent overflow
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          // Overlay content (text + button)
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome to',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const Text(
                      'StyleKart',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
