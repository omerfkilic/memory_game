import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_view_model.dart';
import 'package:memory_game/core/constants/constants.dart' as constants;

Future<dynamic> gamePageGameOverAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          backgroundColor: const Color.fromARGB(255, 238, 85, 34),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 106, 21))),
              child: Text(
                'back_to_main_menu'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
          title: Center(
              child: Column(
            children: [
              Text('congratulations'.tr(), style: constants.textStyleWhite),
              Text('you_won'.tr(), style: constants.textStyleWhite),
            ],
          )),
        );
      });
}
