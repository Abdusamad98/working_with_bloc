import 'package:working_with_bloc/data/models/banking/colors_model.dart';

class CardModel {
  final int id;
  final String cardType;
  final String cardNumber;
  final String bankName;
  final double moneyAmount;
  final String cardCurrency;
  final String expireDate;
  final String iconImage;
  final GradientModel colors;

  CardModel({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.bankName,
    required this.moneyAmount,
    required this.cardCurrency,
    required this.expireDate,
    required this.iconImage,
    required this.colors,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] ?? -1,
      cardType: json['card_type'] ?? "",
      cardNumber: json['card_number'] ?? "",
      bankName: json['bank_name'] ?? "",
      moneyAmount: json['money_amount'] ?? 0.0,
      cardCurrency: json['card_currency'] ?? "",
      expireDate: json['expire_date'] ?? "",
      iconImage: json['icon_image'] ?? "",
      colors: GradientModel.fromJson(json["colors"]),
    );
  }
}
