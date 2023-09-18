// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      email: json['email'] as String,
      id: json['id'] as int,
      isActive: json['isActive'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => DataActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataActivityModel _$DataActivityModelFromJson(Map<String, dynamic> json) =>
    DataActivityModel(
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      id: json['id'] as int,
      ownerId: json['ownerId'] as int,
    );
