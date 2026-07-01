import 'package:flutter/material.dart';
import '../services/progress_service.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  Future<int> getProgress() async {
    return ProgressService().getHiraganaProgress();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getProgress(),
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffEC407A),
                Color(0xffF48FB1),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(.30),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🌸 Welcome Back",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "YumeSprout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Learn Japanese Every Day 🇯🇵",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress / 46,
                        minHeight: 8,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "$progress / 46 Characters Completed",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 15),

              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.20),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "🌸",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}