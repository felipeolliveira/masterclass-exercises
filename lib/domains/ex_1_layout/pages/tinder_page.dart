import 'package:flutter/material.dart';
import 'package:flutter_exercises/domains/ex_1_layout/widgets/bordered_button.dart';

class TinderPage extends StatelessWidget {
  const TinderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffed7262), Color(0xffe94976)]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: () => navigator.pop(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.network(
                                'https://br.tinderpressroom.com/images/tinder_logo_white.png',
                                height: 50,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'By tapping Create Account on Sing in, you agree to our Terms. Learn how we process your data in uor Privacy Policy and Cookies Policy',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.caption?.copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    BorderedButton(
                      onTap: () {},
                      label: 'Sign In With Apple',
                      iconSrc:
                          'https://vipclubvantagens.com.br/wp-content/uploads/2020/07/apple.png',
                    ),
                    const SizedBox(height: 10),
                    BorderedButton(
                      onTap: () {},
                      label: 'Sign In With Facebook',
                      iconSrc:
                          'https://icon-library.com/images/facebook-png-icon-white/facebook-png-icon-white-29.jpg',
                    ),
                    const SizedBox(height: 10),
                    BorderedButton(
                      onTap: () {},
                      label: 'Sign In With Phone Number',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Center(
                  child: Text(
                    'Trouble Signing In?',
                    style: theme.textTheme.bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
