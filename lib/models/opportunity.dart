class OpportunityModel {
  const OpportunityModel({
    required this.id,
    required this.title,
    required this.startupName,
    required this.description,
    required this.location,
    required this.stipend,
    required this.deadline,
    required this.skills,
    required this.sector,
    required this.createdBy,
    this.isFeatured = false,
    this.appliedCount = 0,
  });

  final String id;
  final String title;
  final String startupName;
  final String description;
  final String location;
  final String stipend;
  final String deadline;
  final String skills;
  final String sector;
  final String createdBy;
  final bool isFeatured;
  final int appliedCount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'startupName': startupName,
      'description': description,
      'location': location,
      'stipend': stipend,
      'deadline': deadline,
      'skills': skills,
      'sector': sector,
      'createdBy': createdBy,
      'isFeatured': isFeatured,
      'appliedCount': appliedCount,
    };
  }

  factory OpportunityModel.fromMap(Map<String, dynamic> map) {
    return OpportunityModel(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      startupName: map['startupName'] as String? ?? '',
      description: map['description'] as String? ?? '',
      location: map['location'] as String? ?? '',
      stipend: map['stipend'] as String? ?? '',
      deadline: map['deadline'] as String? ?? '',
      skills: map['skills'] as String? ?? '',
      sector: map['sector'] as String? ?? '',
      createdBy: map['createdBy'] as String? ?? '',
      isFeatured: map['isFeatured'] as bool? ?? false,
      appliedCount: map['appliedCount'] as int? ?? 0,
    );
  }
}
