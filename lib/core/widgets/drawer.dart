import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/core/widgets/blur_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(.5),
      width: double.infinity,
      elevation: 0,
      child: Blur(
        child: Container(),
        overlay: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Discover',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Spacer(),
                  BlurButton(
                    onPressed: () {},
                    icon: Icons.search_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
        blurColor: Colors.black,
        blur: 10,
      ),
    );
  }
}
