import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  Color getCardColor() {
    switch (title) {
      case "Hiragana":
        return const Color(0xffF06292);

      case "Katakana":
        return const Color(0xff7E57C2);

      case "Quiz":
        return const Color(0xffFF9800);

      case "Search":
        return const Color(0xff42A5F5);

      case "Favourite":
        return const Color(0xffEF5350);

      case "Grammar":
        return const Color(0xff66BB6A);

      default:
        return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: getCardColor(),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: getCardColor().withOpacity(.30),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Icon(
                  icon,
                  color: Colors.white,
                  size: 34,
                ),

                const Spacer(),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Start Learning",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 12),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Open",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}