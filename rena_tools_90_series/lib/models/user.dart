import 'dart:convert';

// https://app.quicktype.io/

InfusionBrand infusionBrandFromJson(String str) => InfusionBrand.fromJson(json.decode(str));

String infusionBrandToJson(InfusionBrand data) => json.encode(data.toJson());

class InfusionBrand {
    String name;
    String version;
    String category;
    List<Setting> setting;

    InfusionBrand({
        required this.name,
        required this.version,
        required this.category,
        required this.setting,
    });

    factory InfusionBrand.fromJson(Map<String, dynamic> json) => InfusionBrand(
        name: json["name"],
        version: json["version"],
        category: json["category"],
        setting: List<Setting>.from(json["setting"].map((x) => Setting.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "category": category,
        "setting": List<dynamic>.from(setting.map((x) => x.toJson())),
    };
}

class Setting {
    String id;
    String type;
    String name;
    String spec;
    Map<String, double> calib;

    Setting({
        required this.id,
        required this.type,
        required this.name,
        required this.spec,
        required this.calib,
    });

    factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        spec: json["spec"],
        calib: Map.from(json["calib"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "spec": spec,
        "calib": Map.from(calib).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
