// ignore_for_file: avoid_print

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePageCubit extends Cubit<GamePageState> {
  GamePageCubit() : super(GamePageInitial());
  String? firstCardName;
  String? secondCardName;
  GlobalKey<FlipCardState>? firstCardKey;
  GlobalKey<FlipCardState>? secondCardKey;

  void flipCard(
      String flippedCardName, GlobalKey<FlipCardState> flippedCardKey) {
    emit(GamePageLoading());
    if (firstCardName == null) {
      print('first time');
      _firstFlip(flippedCardName, flippedCardKey);
    } else {
      print('second time');

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

    emit(GamePageFirstCardFlipped());
  }

  void _secondFlip(
      String flippedCardName, GlobalKey<FlipCardState> flippedCardKey) async {
    emit(GamePageLoading());

    secondCardName = flippedCardName;
    secondCardKey = flippedCardKey;
    flippedCardKey.currentState!.toggleCard();
    await Future.delayed(Duration(seconds: 1));
    //const Duration(seconds: 10, minutes: 1);

    print(flippedCardName);
    if (firstCardName == secondCardName) {
      print('Flipped Cards Correct');
      emit(GamePageFlippedCardsCorrect());
    } else {
      firstCardKey!.currentState!.toggleCard();
      secondCardKey!.currentState!.toggleCard();

      print('Flipped Cards InCorrect');
      emit(GamePageFlippedCardsInCorrect());
    }
    firstCardKey = null;
    firstCardName = null;
    secondCardKey = null;
    secondCardName = null;
  }
}

@immutable
abstract class GamePageState {}

class GamePageInitial extends GamePageState {}

class GamePageReady extends GamePageState {}

class GamePageLoading extends GamePageState {}

class GamePageFirstCardFlipped extends GamePageState {}

class GamePageFlippedCardsCorrect extends GamePageState {}

class GamePageFlippedCardsInCorrect extends GamePageState {}

class GamePageGameOver extends GamePageState {}
