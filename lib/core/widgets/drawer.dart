import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'blur_button.dart';

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
              SizedBox(height: 20),
              Text(
                'Movies',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(108, 229, 45, 39),
                      Color.fromARGB(0, 179, 18, 23),
                    ],
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                  ),
                  border: Border(
                    left: BorderSide(
                      width: 5,
                      color: Colors.red,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Now Playing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
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
