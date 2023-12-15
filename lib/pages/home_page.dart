import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text("Press here"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
