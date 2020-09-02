
import 'package:cloud_firestore/cloud_firestore.dart';

import 'boarditem.dart';

class BoardListModel {
  String title;
  List<BoardItemModel> items = List<BoardItemModel>();
  DocumentReference reference;

  BoardListModel(this.title, {this.reference, this.items});

  factory BoardListModel.fromSnapshot(DocumentSnapshot snapshot) {
    BoardListModel newBoardListModel = BoardListModel.fromJson(snapshot.data());
    newBoardListModel.reference = snapshot.reference;
    return newBoardListModel;
  }

  factory BoardListModel.fromJson(Map<String, dynamic> json) => _BoardListModelFromJson(json);

  Map<String, dynamic> toJson() => _BoardListModelToJson(this);

  @override
  String toString() => "BoardListModel<$title>";
}

BoardListModel _BoardListModelFromJson(Map<String, dynamic> json) {
  return BoardListModel(
    json['title'] as String,
    items: _convertBoarditemList(json['boarditemList'] as List)
  );
}

List<BoardItemModel> _convertBoarditemList(List boarditemListMap) {
  if (boarditemListMap == null) {
    return null;
  }
  List<BoardItemModel> boarditemList =  List<BoardItemModel>();
  boarditemListMap.forEach((value) {
    boarditemList.add(BoardItemModel.fromJson(value));
  });
  return boarditemList;
}

Map<String, dynamic> _BoardListModelToJson(BoardListModel instance) => <String, dynamic> {
      'title': instance.title,
      'boarditemList': _BoarditemList(instance.items),
    };

List<Map<String, dynamic>> _BoarditemList(List<BoardItemModel> boarditemList) {
  if (boarditemList == null) {
    return null;
  }
  List<Map<String, dynamic>> boarditemListMap =List<Map<String, dynamic>>();
  boarditemList.forEach((boarditem) {
    boarditemListMap.add(boarditem.toJson());
  });
  return boarditemListMap;
}
