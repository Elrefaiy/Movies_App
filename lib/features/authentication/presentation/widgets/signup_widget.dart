import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../cubit/authentication_cubit.dart';
import 'input_field.dart';

import '../../../../core/utils/app_strings.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = AuthenticationCubit.get(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(.7),
            BlendMode.darken,
          ),
          image: AssetImage(
            '${AppStrings.assetImage}signup.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
            ),
            Text(
              'create your new\naccount!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            InputField(
              label: 'User Name',
            ),
            SizedBox(height: 15),
            InputField(
              label: 'Email Address',
            ),
            SizedBox(height: 15),
            InputField(
              label: 'Password',
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    cubit.chageIndex(0);
                    cubit.pageController.previousPage(
                      duration: 500.ms,
                      curve: Curves.linearToEaseOut,
                    );
                  },
                  child: Text(
                    'Sign in now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
