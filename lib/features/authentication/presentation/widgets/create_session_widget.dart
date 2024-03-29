import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/functions.dart';
import '../cubit/authentication_cubit.dart';

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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 80),
            Icon(
              Icons.account_circle,
              color: Colors.white.withOpacity(.3),
              size: 250,
            ),
            SizedBox(height: 20),
            Text(
              'User Session',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10),
            Text(
              'If all set, you get started with full-user cababilities\nby creating new session!',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is CreateSessionSuccess) {
                    AppFunctions.showSnakBar(
                      context: context,
                      lable: 'Welcome to your own session, have a good time!',
                      icon: Icons.done_rounded,
                      iconColor: Colors.greenAccent,
                      duration: 2,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.moviesHome,
                      (route) => false,
                    );
                  } else if (state is CreateSessionError) {
                    AppFunctions.showSnakBar(
                      context: context,
                      lable: 'Error occured, try to authorize again please!',
                      icon: Icons.close,
                      iconColor: Colors.redAccent,
                      duration: 2,
                    );
                  }
                },
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      cubit.createSession();
                    },
                    child: Text(
                      'Get Started!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
