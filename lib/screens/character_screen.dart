import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  final String jp;
  final String romaji;
  final String meaning;
  final String example;

  const CharacterScreen({
    super.key,
    required this.jp,
    required this.romaji,
    required this.meaning,
    required this.example,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 30),

            Text(
              jp,
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              romaji,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text("Meaning"),
              subtitle: Text(meaning),
            ),

            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Example"),
              subtitle: Text(example),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.volume_up),
              label: const Text("Play Audio"),
            ),
          ],
        ),
      ),
    );
  }
}