class EducationHistory {
  String educationStatus;
  String schoolName;
  String department;
  DateTime startDate;
  DateTime endDate;

  EducationHistory({
    required this.educationStatus,
    required this.schoolName,
    required this.department,
    required this.startDate,
    required this.endDate,
  });

  factory EducationHistory.fromFirestore(Map<String, dynamic> json) {
    return EducationHistory(
      educationStatus: json['educationStatus'],
      schoolName: json['schoolName'],
      department: json['department'],
      startDate: DateTime.parse(json['startDate'] ?? ''),
      endDate: DateTime.parse(json['endDate'] ?? ''),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'schoolName': schoolName,
      'department': department,
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
    };
  }
}
