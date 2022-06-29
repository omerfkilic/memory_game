// ignore_for_file: avoid_print

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePageCubit extends Cubit<GamePageState> {
  GamePageCubit() : super(GamePageReady());
  String? firstCardName;
  String? secondCardName;
  GlobalKey<FlipCardState>? firstCardKey;
  GlobalKey<FlipCardState>? secondCardKey;
  int score = 0;
  List<Function> removeFunctions = [];

  void flipCard(String flippedCardName, GlobalKey<FlipCardState> flippedCardKey,
      Function flipCardRemoveFunction) {
    emit(GamePageLoading());

    if (firstCardName == null) {
      removeFunctions.add(flipCardRemoveFunction);
      print('first time');
      _firstFlip(flippedCardName, flippedCardKey);
    } else {
      print('second time');
      removeFunctions.add(flipCardRemoveFunction);
      _secondFlip(flippedCardName, flippedCardKey);
    }
  }

  void _firstFlip(
      String flippedCardName, GlobalKey<FlipCardState> flippedCardKey) {
    emit(GamePageLoading());

    firstCardName = flippedCardName;
    firstCardKey = flippedCardKey;
    flippedCardKey.currentState!.toggleCard();

    print(flippedCardName);

    emit(GamePageReady());
  }

  void _secondFlip(
      String flippedCardName, GlobalKey<FlipCardState> flippedCardKey) async {
    emit(GamePageLoading());

    secondCardName = flippedCardName;
    secondCardKey = flippedCardKey;
    flippedCardKey.currentState!.toggleCard();
    await Future.delayed(const Duration(seconds: 1));

    print(flippedCardName);
    if (firstCardName == secondCardName) {
      score += 2;
      print('Flipped Cards Correct score is $score');
      for (var removeFunction in removeFunctions) {
        removeFunction();
      }

      emit(GamePageReady());
    } else {
      firstCardKey!.currentState!.toggleCard();
      secondCardKey!.currentState!.toggleCard();

      print('Flipped Cards InCorrect');
      emit(GamePageReady());
    }
    firstCardKey = null;
    firstCardName = null;
    secondCardKey = null;
    secondCardName = null;
    removeFunctions = [];
    if (score == 12) {
      emit(GamePageGameOver());
    }
  }
}

@immutable
abstract class GamePageState {}

class GamePageReady extends GamePageState {}

class GamePageLoading extends GamePageState {}

class GamePageGameOver extends GamePageState {}
