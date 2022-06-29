// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/core/models/game_card_model.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_cubit.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_view_model.dart';
import 'package:memory_game/core/constants/constants.dart' as constants;

// ignore: must_be_immutable
class GameCardWidget extends StatefulWidget {
  GameCardWidget({
    Key? key,
    required this.gameCard,
  }) : super(key: key);
  late GameCardModel gameCard;

  @override
  State<GameCardWidget> createState() => _GameCardWidgetState();
}

class _GameCardWidgetState extends State<GameCardWidget> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> _key = GlobalKey<FlipCardState>();
    GamePageViewModel.fruitKeys.add(_key);
    bool _enable = true;
    flipCardRemoveFunction() {
      print('removed');
      _opacity = 0;
    }

    return BlocBuilder<GamePageCubit, GamePageState>(
      builder: (context, state) {
        return Container(
          height: 150,
          width: 150,
          padding: const EdgeInsets.all(4.0),
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            child: FlipCard(
              key: _key,
              flipOnTouch: false,
              onFlipDone: (v) => _enable = true,
              front: Container(
                decoration: constants.flipCardBoxDecoration,
                child: GestureDetector(
                  onSecondaryTap: () => false,
                  onTap: () => {
                    if (_enable = true)
                      {
                        _enable = false,
                        if (state is! GamePageLoading)
                          {
                            context.read<GamePageCubit>().flipCard(
                                widget.gameCard.cardName,
                                _key,
                                flipCardRemoveFunction)
                          }
                      }
                  },
                  child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Image.asset(
                        constants.questionMarkUrl,
                        color: const Color.fromARGB(255, 251, 139, 51),
                      )),
                ),
              ),
              back: Container(
                  decoration: constants.flipCardBoxDecoration,
                  child: Image.asset(widget.gameCard.imageUrl)),
            ),
          ),
        );
      },
    );
  }
}
