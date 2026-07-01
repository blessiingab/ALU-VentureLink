class Application {
  final String id;
  final String opportunityId;
  final String studentId;
  final String startupId;
  final String status; // 'applied', 'reviewed', 'shortlisted', 'rejected', 'accepted'
  final String? coverLetter;
  final DateTime appliedAt;
  final DateTime? respondedAt;

  Application({
    required this.id,
    required this.opportunityId,
    required this.studentId,
    required this.startupId,
    required this.status,
    this.coverLetter,
    required this.appliedAt,
    this.respondedAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'],
      opportunityId: json['opportunityId'],
      studentId: json['studentId'],
      startupId: json['startupId'],
      status: json['status'],
      coverLetter: json['coverLetter'],
      appliedAt: DateTime.parse(json['appliedAt']),
      respondedAt: json['respondedAt'] != null ? DateTime.parse(json['respondedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'opportunityId': opportunityId,
      'studentId': studentId,
      'startupId': startupId,
      'status': status,
      'coverLetter': coverLetter,
      'appliedAt': appliedAt.toIso8601String(),
      'respondedAt': respondedAt?.toIso8601String(),
    };
  }
}
