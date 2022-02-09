import 'package:flutter/material.dart';
import 'package:flutter_exercises/domains/ex_1_layout/widgets/contained_button.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () => navigator.pop(),
              child: const Text(
                'voltar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: Colors.orange.withOpacity(0.1),
                          size: 300,
                        ),
                        const Icon(
                          Icons.savings,
                          color: Colors.deepOrange,
                          size: 100,
                        ),
                      ],
                    ),
                    Text(
                      'Get your Money\nUnder Control',
                      style: theme.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Manage your expenses.',
                      style: theme.textTheme.headline6?.copyWith(
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Seamlessly.',
                      style: theme.textTheme.headline6?.copyWith(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ContainedButton(
                    label: 'Sign Up with Email ID',
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    onTap: () => {},
                  ),
                  const SizedBox(height: 10),
                  const ContainedButton(
                    label: 'Sign Up with Google',
                    iconSrc: 'https://freesvg.org/img/1534129544.png',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: theme.textTheme.bodyText1
                        ?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'SignIn',
                    style: theme.textTheme.bodyText1?.copyWith(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
