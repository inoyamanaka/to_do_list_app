// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserActivityEntity extends Equatable {
  const UserActivityEntity({
    required this.email,
    required this.id,
    required this.isActive,
    required this.items,
  });
  final String email;
  final int id;
  final bool isActive;
  final List<DataActivityEntity> items;

  @override
  List<Object?> get props => [email, id, isActive, items];
}

class DataActivityEntity extends Equatable {
  const DataActivityEntity({
    required this.title,
    required this.description,
    required this.category,
    required this.id,
    required this.ownerId,
  });
  final String title;
  final String description;
  final String category;
  final int id;
  final int ownerId;

  @override
  List<Object?> get props => [title, description, category, id, ownerId];
}

class LocalDataActivityEntity extends Equatable {
  String title;
  String category;
  String date;
  String startTime;
  String finishTime;
  LocalDataActivityEntity({
    required this.title,
    required this.category,
    required this.date,
    required this.startTime,
    required this.finishTime,
  });

  @override
  List<Object?> get props => [title, category];
}
