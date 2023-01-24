class GradientModel {
  final String colorA;
  final String colorB;

  GradientModel({
    required this.colorA,
    required this.colorB,
  });

  factory GradientModel.fromJson(Map<String, dynamic> json) {
    return GradientModel(
      colorA: json['color_a'] ?? "",
      colorB: json['color_b'] ?? "",
    );
  }
}