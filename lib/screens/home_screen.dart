import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ostoslista")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Tervetuloa ostoslistaan!", style: TextStyle(fontSize: 24)),
          Expanded(
            child: ListView(
              children: [
                ListTile(title: Text("Maito")),
                ListTile(title: Text("Leipä")),
                ListTile(title: Text("Munat")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
