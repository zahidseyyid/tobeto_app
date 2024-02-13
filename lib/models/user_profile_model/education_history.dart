class EducationHistory {
  String educationStatus;
  String schoolName;
  String department;
  String startDate;
  String endDate;

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
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'educationStatus': educationStatus,
      'schoolName': schoolName,
      'department': department,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
