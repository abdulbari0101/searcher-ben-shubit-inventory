class DateModel {
  String? dateId;
  String? date;

  DateModel({
    this.dateId,
    this.date,
  });
  //toJson method to convert DateModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': dateId,
      'LAST_UPDATE': date,
    };
  }
  //fromJson method to convert JSON to DateModel
  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      dateId: json['id']?.toString(),
      date: json['LAST_UPDATE']?.toString(),
    );
  }
}