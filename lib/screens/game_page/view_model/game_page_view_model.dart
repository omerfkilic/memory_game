// ignore_for_file: file_names

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/core/constants/constants.dart' as constant;

import '../../../core/models/game_card_model.dart';

class GamePageViewModel {
  static List<GameCardModel> fruitCards = [];
  static List<GlobalKey<FlipCardState>> fruitKeys = [];

  static prepareCards() {
    for (var i = 0; i < constant.fruits.length; i++) {
      fruitCards.add(GameCardModel(
          cardName: constant.fruits[i],
          imageUrl: '${constant.fruitsUrl}${constant.fruits[i]}.png'));

      fruitCards.add(GameCardModel(
          cardName: constant.fruits[i],
          imageUrl: '${constant.fruitsUrl}${constant.fruits[i]}.png'));
    }

    fruitCards.shuffle();
  }
}
