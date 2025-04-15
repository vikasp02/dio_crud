// To parse this JSON data, do
//
//     final faqs = faqsFromJson(jsonString);

import 'dart:convert';

Faqs faqsFromJson(String str) => Faqs.fromJson(json.decode(str));

String faqsToJson(Faqs data) => json.encode(data.toJson());

class Faqs {
  List<Faq>? faqs;

  Faqs({this.faqs});

  factory Faqs.fromJson(Map<String, dynamic> json) => Faqs(
    faqs:
        json["faqs"] == null
            ? []
            : List<Faq>.from(json["faqs"]!.map((x) => Faq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "faqs":
        faqs == null ? [] : List<dynamic>.from(faqs!.map((x) => x.toJson())),
  };
}

class Faq {
  String? id;
  String? user;
  String? question;
  String? answer;
  DateTime? createdAt;
  int? v;

  Faq({this.id, this.user, this.question, this.answer, this.createdAt, this.v});

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    id: json["_id"],
    user: json["user"],
    question: json["question"],
    answer: json["answer"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "question": question,
    "answer": answer,
    "createdAt": createdAt?.toIso8601String(),
    "__v": v,
  };
}
