import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/functions.dart';
import 'package:movies_application/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:movies_application/features/authentication/presentation/screens/auth_web_screen.dart';

class RequestTokenScreen extends StatelessWidget {
  const RequestTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthenticationCubit.get(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fingerprint,
              color: Colors.grey[700],
              size: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Authorization needed',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10),
            Text(
              'To serve you best user experience\nyou need to authenticate your email.',
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
                  if (state is CreateRequestTokenSuccess) {
                    AppFunctions.showSnakBar(
                      context: context,
                      lable: 'All set, you can go now!',
                      icon: Icons.done_rounded,
                      iconColor: Colors.greenAccent,
                      duration: 2,
                    );
                  } else if (state is CreateRequestTokenError) {}
                },
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      if (cubit.requestToken.isNotEmpty) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AuthWebScreen(
                              requestToken: cubit.requestToken,
                            );
                          },
                        ));
                      } else {
                        cubit.createRequestToken();
                      }
                    },
                    child: Text(
                      'GO!',
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
