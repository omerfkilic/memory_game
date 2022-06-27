import 'package:flutter/material.dart';
import 'package:memory_game/screens/game_page/view/game_page_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Matching',
      home: GamePage(),
    );
  }
}
