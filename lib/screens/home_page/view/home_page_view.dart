import 'package:flutter/material.dart';

import '../widgets/new_game_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 25),
            Text('Card Matching'),
            SizedBox(height: 150),
            NewGameElevatedButton()
          ],
        ),
      ),
    );
  }
}
