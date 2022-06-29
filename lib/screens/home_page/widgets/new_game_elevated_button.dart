import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/screens/game_page/view/game_page_view.dart';

class NewGameElevatedButton extends StatelessWidget {
  const NewGameElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 251, 110, 30))),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GamePage()));
        },
        child: Text('play'.tr()));
  }
}
