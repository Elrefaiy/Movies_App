import 'package:flutter/material.dart';
import 'package:movies_application/features/authentication/presentation/widgets/signup_widget.dart';

import '../cubit/authentication_cubit.dart';
import '../widgets/signin_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AuthenticationCubit.get(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: cubit.pageController,
            onPageChanged: (index) {
              cubit.chageIndex(index);
            },
            children: [
              SignInWidget(),
              SignUpWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 35,
            ),
            child: Row(
              children: [
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'SIGN Up',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.6),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
