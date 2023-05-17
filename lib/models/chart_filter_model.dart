class ChartFilterModel {
  DateTime? startDateTime;
  DateTime? endDateTime;
  String country;
  String category;
  ChartFilterModel({
    this.startDateTime,
    this.endDateTime,
    this.country = "",
    this.category = "",
  });
}
