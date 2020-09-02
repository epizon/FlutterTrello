
import 'package:cloud_firestore/cloud_firestore.dart';


class BoardItemModel {
  String title;
  DocumentReference reference;

  BoardItemModel(this.title, {this.reference});

  factory BoardItemModel.fromJson(Map<dynamic, dynamic> json) => _VaccinationFromJson(json);

  Map<String, dynamic> toJson() => _VaccinationToJson(this);

  @override
  String toString() => "Vaccination<$title>";

}

BoardItemModel _VaccinationFromJson(Map<dynamic, dynamic> json) {
  return BoardItemModel(
    json['title'] as String,
  );
}

Map<String, dynamic> _VaccinationToJson(BoardItemModel instance) =>
    <String, dynamic> {
      'title': instance.title,
    };
