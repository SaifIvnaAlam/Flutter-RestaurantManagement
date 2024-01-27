import 'package:flutter/material.dart';

class DiscordNavbar extends StatelessWidget {
  const DiscordNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 0.08,
        heightFactor: 1,
        child: Container(
          color: Colors.grey,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
