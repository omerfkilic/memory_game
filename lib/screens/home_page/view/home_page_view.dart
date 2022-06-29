import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/screens/home_page/widgets/new_game_elevated_button.dart';
import '../../game_page/view/game_page_view.dart';
import 'package:memory_game/core/constants/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Size.infinite.width,
        decoration: constants.backgroundDecoration,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 25),
              child: Container(
                decoration: constants.langSelectorBoxDecoration,
                child: DropdownButton(
                  dropdownColor: const Color.fromARGB(255, 251, 110, 30),
                  style: const TextStyle(color: Colors.white),
                  value: context.locale,
                  items: constants.localizationDropDownItems,
                  onChanged: (dynamic languageCode) {
                    setState(() {
                      context.setLocale(languageCode);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 100),
            Text('memory_game'.tr(), style: constants.textStyleWhite),
            const SizedBox(height: 150),
            const NewGameElevatedButton()
          ],
        ),
      ),
    );
  }
}
