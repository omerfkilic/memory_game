import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/core/models/game_card_model.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_cubit.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_view_model.dart';

// ignore: must_be_immutable
class GameCardWidget extends StatefulWidget {
  GameCardWidget({
    Key? key,
    required this.gameCard,
  }) : super(key: key);
  late GameCardModel gameCard;

  //late GlobalObjectKey<FlipCardState> key;
  @override
  State<GameCardWidget> createState() => _GameCardWidgetState();
}

class _GameCardWidgetState extends State<GameCardWidget> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> key = GlobalKey<FlipCardState>();
    GamePageViewModel.fruitKeys.add(key);
    return BlocBuilder<GamePageCubit, GamePageState>(
      builder: (context, state) {
        return FlipCard(
          key: key,
          flipOnTouch: false,
          front: Container(
            color: Colors.blue,
            child: GestureDetector(
              onTap: () => {
                if (state is! GamePageLoading)
                  {
                    context
                        .read<GamePageCubit>()
                        .flipCard(widget.gameCard.cardName, key)
                  }
              },
              child: const Text('Front side'),
            ),
          ),
          back: Image.asset(widget.gameCard.imageUrl),
        );
      },
    );
  }
}
