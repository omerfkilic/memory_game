import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/core/models/game_card_model.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_cubit.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_view_model.dart';
import 'package:memory_game/core/constants/constants.dart' as constant;

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
  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> key = GlobalKey<FlipCardState>();
    GamePageViewModel.fruitKeys.add(key);
    return BlocBuilder<GamePageCubit, GamePageState>(
      builder: (context, state) {
        return Container(
          height: 333.h,
          width: 333.w,
          padding: const EdgeInsets.all(4.0),
          child: FlipCard(
            //alignment: Alignment.center,
            key: key,
            flipOnTouch: false,
            front: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 251, 110, 30)),
              child: GestureDetector(
                onTap: () => {
                  if (state is! GamePageLoading)
                    {
                      context
                          .read<GamePageCubit>()
                          .flipCard(widget.gameCard.cardName, key)
                    }
                },
                child: Container(
                    margin: const EdgeInsets.all(4),
                    child: Image.asset(
                      constant.questionMarkUrl,
                      color: const Color.fromARGB(255, 251, 139, 51),
                    )),
              ),
            ),
            back: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 251, 110, 30)),
                child: Image.asset(widget.gameCard.imageUrl)),
          ),
        );
      },
    );
  }
}
