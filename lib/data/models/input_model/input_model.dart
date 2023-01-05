
part 'input_model.g.dart';

class InputModel {
  String code;

  String caption;

  String fullCaption;

  int sort;

  String group;

  String initialValue;

  String regExp;

  bool required;

  String type;

  List<String> values;

  InputModel({
    required this.code,
    required this.caption,
    required this.values,
    required this.required,
    required this.type,
    required this.regExp,
    required this.initialValue,
    required this.group,
    required this.sort,
    required this.fullCaption,
  });

  factory InputModel.fromJson(Map<String, dynamic> json) => InputModel(
    code: json['code'] as String? ?? '',
    caption: json['caption'] as String? ?? '',
    values: (json['values'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList() ??
        [],
    required: json['required'] as bool? ?? false,
    type: json['type'] as String? ?? '',
    regExp: json['regExp'] as String? ?? '',
    initialValue: json['initial_value'] as String? ?? '',
    group: json['group'] as String? ?? '',
    sort: json['sort'] as int? ?? 0,
    fullCaption: json['fullCaption'] as String? ?? '',
  );
}

