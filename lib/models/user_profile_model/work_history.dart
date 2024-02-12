class WorkHistory {
  String company;
  String position;
  String sector;
  String city;
  DateTime startDate;
  DateTime? endDate;
  String description;

  WorkHistory({
    required this.company,
    required this.position,
    required this.sector,
    required this.city,
    required this.startDate,
    this.endDate,
    required this.description,
  });

  factory WorkHistory.fromFirestore(Map<String, dynamic> json) {
    return WorkHistory(
      company: json['company'],
      position: json['position'],
      sector: json['sector'],
      city: json['city'],
      startDate: DateTime.parse(json['startDate'] ?? ''),
      endDate: DateTime.parse(json['endDate'] ?? ''),
      description: json['description'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'company': company,
      'position': position,
      'sector': sector,
      'city': city,
      'startDate': startDate.toString(),
      'endDate': endDate?.toString(),
      'description': description,
    };
  }
}
