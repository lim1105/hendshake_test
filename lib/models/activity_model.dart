class ActivityModel {
  final String? activity;
  final String? type;
  final int? participants;
  final double? price;
  final String? link;
  final String? key;
  final double? accessibility;

  ActivityModel({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  ActivityModel copyWith({
    String? activity,
    String? type,
    int? participants,
    double? price,
    String? link,
    String? key,
    double? accessibility,
  }) =>
      ActivityModel(
        activity: activity ?? this.activity,
        type: type ?? this.type,
        participants: participants ?? this.participants,
        price: price ?? this.price,
        link: link ?? this.link,
        key: key ?? this.key,
        accessibility: accessibility ?? this.accessibility,
      );

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"]?.toDouble(),
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };
}
