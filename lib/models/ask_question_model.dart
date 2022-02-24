// To parse this JSON data, do
//
//     final askQuestionModel = askQuestionModelFromJson(jsonString);

import 'dart:convert';

AskQuestionModel askQuestionModelFromJson(String str) => AskQuestionModel.fromJson(json.decode(str));

String askQuestionModelToJson(AskQuestionModel data) => json.encode(data.toJson());

class AskQuestionModel {
  AskQuestionModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });

  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  List<QuestionCategory> data;

  factory AskQuestionModel.fromJson(Map<String, dynamic> json) => AskQuestionModel(
    httpStatus: json["httpStatus"],
    httpStatusCode: json["httpStatusCode"],
    success: json["success"],
    message: json["message"],
    apiName: json["apiName"],
    data: List<QuestionCategory>.from(json["data"].map((x) => QuestionCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "httpStatus": httpStatus,
    "httpStatusCode": httpStatusCode,
    "success": success,
    "message": message,
    "apiName": apiName,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class QuestionCategory {
  QuestionCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.suggestions,
  });

  int id;
  String name;
  String description;
  double price;
  List<String> suggestions;

  factory QuestionCategory.fromJson(Map<String, dynamic> json) => QuestionCategory(
    id: json["id"],
    name: json["name"],
    description: json["description"] ?? "",
    price: json["price"],
    suggestions: List<String>.from(json["suggestions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description ?? "",
    "price": price,
    "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
  };
}
