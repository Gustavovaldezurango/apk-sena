// To parse this JSON data, do
//
//     final reqResArea = reqResAreaFromJson(jsonString);

import 'dart:convert';

List<ReqResArea> reqResAreaFromJson(String str) => List<ReqResArea>.from(json.decode(str).map((x) => ReqResArea.fromJson(x)));

String reqResAreaToJson(List<ReqResArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqResArea {
    ReqResArea({
        this.id = 0,
        this.urlArea ="",
    });

    int id;
    String urlArea;

    factory ReqResArea.fromJson(Map<String, dynamic> json) => ReqResArea(
        id: json["id"],
        urlArea: json["url_Area"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url_Area": urlArea,
    };
}

