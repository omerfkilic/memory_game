import 'package:flutter/material.dart';

class NewGameElevatedButton extends StatelessWidget {
  const NewGameElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          //TODO Navigate işlemini yaz
        },
        child: const Text('New Game'));
  }
}
