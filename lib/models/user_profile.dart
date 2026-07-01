class AppUserModel {
  const AppUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.bio,
    required this.campus,
    required this.interests,
    this.startupName,
    this.verified = false,
  });

  final String id;
  final String name;
  final String email;
  final String role;
  final String bio;
  final String campus;
  final String interests;
  final String? startupName;
  final bool verified;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'bio': bio,
      'campus': campus,
      'interests': interests,
      'startupName': startupName,
      'verified': verified,
    };
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? 'ALU Member',
      email: map['email'] as String? ?? '',
      role: map['role'] as String? ?? 'student',
      bio: map['bio'] as String? ?? 'Excited to contribute to the ALU ecosystem.',
      campus: map['campus'] as String? ?? 'Kigali',
      interests: map['interests'] as String? ?? 'Software development',
      startupName: map['startupName'] as String?,
      verified: map['verified'] as bool? ?? false,
    );
  }
}
