class WorkHistory {
  String company;
  String position;
  String sector;
  String city;
  String startDate;
  String endDate;
  String description;

  WorkHistory({
    required this.company,
    required this.position,
    required this.sector,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  factory WorkHistory.fromFirestore(Map<String, dynamic> json) {
    return WorkHistory(
      company: json['company'],
      position: json['position'],
      sector: json['sector'],
      city: json['city'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'company': company,
      'position': position,
      'sector': sector,
      'city': city,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
    };
  }
}
