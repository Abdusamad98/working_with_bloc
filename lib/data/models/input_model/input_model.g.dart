// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputModel _$InputModelFromJson(Map<String, dynamic> json) => InputModel(
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

Map<String, dynamic> _$InputModelToJson(InputModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'caption': instance.caption,
      'fullCaption': instance.fullCaption,
      'sort': instance.sort,
      'group': instance.group,
      'initial_value': instance.initialValue,
      'regExp': instance.regExp,
      'required': instance.required,
      'type': instance.type,
      'values': instance.values,
    };
