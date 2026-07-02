import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import 'animated_xp_bar.dart';

class HomeBannerV2 extends StatelessWidget {
  final String userName;
  final int level;
  final String levelName;
  final int streak;
  final int xp;
  final int currentXP;

  const HomeBannerV2({
    super.key,
    required this.userName,
    required this.level,
    required this.levelName,
    required this.streak,
    required this.xp,
    required this.currentXP,
  });

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "🌅 Good Morning";
    } else if (hour < 17) {
      return "☀️ Good Afternoon";
    } else if (hour < 21) {
      return "🌇 Good Evening";
    } else {
      return "🌙 Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 180,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: AppRadius.xl,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.18),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            getGreeting(),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Welcome back, $userName 👋",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$levelName • Level $level",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  "🔥 $streak Day",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  "⭐ $xp XP",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          AnimatedXPBar(
            progress: currentXP / 100,
            label: "$currentXP / 100 XP",
          ),

          const SizedBox(height: 10),

          const Divider(
            color: Colors.white24,
          ),

          const SizedBox(height: 8),

          const Text(
            "今日も頑張ろう！\nLet's do our best today.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}