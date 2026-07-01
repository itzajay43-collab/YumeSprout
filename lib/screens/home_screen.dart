import 'package:flutter/material.dart';

import '../widgets/menu_card.dart';
import '../widgets/home_banner.dart';

import 'hiragana_screen.dart';
import 'favourite_screen.dart';
import 'search_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "🌸 YumeSprout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const HomeBanner(),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [

                  MenuCard(
                    icon: Icons.menu_book,
                    title: "Hiragana",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HiraganaScreen(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    icon: Icons.quiz,
                    title: "Quiz",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QuizScreen(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    icon: Icons.search,
                    title: "Search",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchScreen(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    icon: Icons.favorite,
                    title: "Favourite",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FavouriteScreen(),
                        ),
                      );
                    },
                  ),

                  MenuCard(
                    icon: Icons.edit,
                    title: "Katakana",
                    onTap: () {},
                  ),

                  MenuCard(
                    icon: Icons.auto_stories,
                    title: "Grammar",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}