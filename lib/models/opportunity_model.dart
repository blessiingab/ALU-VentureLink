class Opportunity {
  final String id;
  final String startupId;
  final String title;
  final String description;
  final String role;
  final List<String> skills;
  final String type; // 'internship', 'fulltime', 'contract'
  final String duration;
  final String? salary;
  final String? location;
  final DateTime deadline;
  final int applicants;
  final DateTime createdAt;

  Opportunity({
    required this.id,
    required this.startupId,
    required this.title,
    required this.description,
    required this.role,
    this.skills = const [],
    required this.type,
    required this.duration,
    this.salary,
    this.location,
    required this.deadline,
    this.applicants = 0,
    required this.createdAt,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      id: json['id'],
      startupId: json['startupId'],
      title: json['title'],
      description: json['description'],
      role: json['role'],
      skills: List<String>.from(json['skills'] ?? []),
      type: json['type'],
      duration: json['duration'],
      salary: json['salary'],
      location: json['location'],
      deadline: DateTime.parse(json['deadline']),
      applicants: json['applicants'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startupId': startupId,
      'title': title,
      'description': description,
      'role': role,
      'skills': skills,
      'type': type,
      'duration': duration,
      'salary': salary,
      'location': location,
      'deadline': deadline.toIso8601String(),
      'applicants': applicants,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
