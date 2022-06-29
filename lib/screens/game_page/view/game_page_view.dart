import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_cubit.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_view_model.dart';
import 'package:memory_game/screens/game_page/widgets/game_card_widget.dart';
import 'package:memory_game/screens/game_page/widgets/game_over_alert_dialog.dart';
import 'package:memory_game/core/constants/constants.dart' as constants;

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    GamePageViewModel.clearCache();
    GamePageViewModel.prepareCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamePageCubit(),
      child: BlocListener<GamePageCubit, GamePageState>(
        listener: (context, state) {
          if (state is GamePageGameOver) {
            gamePageGameOverAlertDialog(context);
          }
        },
        child: Scaffold(
          body: Container(
            decoration: constants.backgroundDecoration,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 80,
                  child: Text(
                    'fruits'.tr().toUpperCase(),
                    style: constants.textStyleWhite,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: GamePageViewModel.fruitCards.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) => GameCardWidget(
                        gameCard: GamePageViewModel.fruitCards[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
