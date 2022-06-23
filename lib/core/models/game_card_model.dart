class GameCardModel {
  late String imageUrl;
  late String cardName;

  ///state 0'sa kart kapalıdır
  ///state 1'se kart ilk kez açılmıştır
  ///state 2'yse kart eşitle eşleşmiştir
  int state = 0;
  GameCardModel({
    required this.cardName,
    required this.imageUrl,
  });
}
