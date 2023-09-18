// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'activity_request.g.dart';

@JsonSerializable(createFactory: false)
class DataActivityBody {
  final String title;
  final String description;
  final String category;
  DataActivityBody({
    required this.title,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$DataActivityBodyToJson(this);
}
