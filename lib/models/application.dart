class OpportunityApplicationModel {
  const OpportunityApplicationModel({
    required this.id,
    required this.opportunityId,
    required this.studentName,
    required this.studentEmail,
    required this.message,
    this.status = 'pending',
  });

  final String id;
  final String opportunityId;
  final String studentName;
  final String studentEmail;
  final String message;
  final String status;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'opportunityId': opportunityId,
      'studentName': studentName,
      'studentEmail': studentEmail,
      'message': message,
      'status': status,
    };
  }
}
