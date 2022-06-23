import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_cubit.dart';
import 'package:memory_game/screens/game_page/view_model/game_page_view_model.dart';
import 'package:memory_game/screens/game_page/widgets/game_card_widget.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    // TODO: Burada kartları oluştur
    GamePageViewModel.prepareCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamePageCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('fruits'),
        ),
        body: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: GamePageViewModel.fruitCards.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 3 : 4),
              itemBuilder: (context, index) => GameCardWidget(
                gameCard: GamePageViewModel.fruitCards[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
