import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage('assets/images/no_internet.png'),
            width: 80,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'No Internet',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Try :',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '● Checking the network cables and router.\n● Reconnecting to Wi-Fi.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ).animate(
        effects: [
          FadeEffect(
            duration: 1.seconds,
          ),
        ],
      ),
    );
  }
}
