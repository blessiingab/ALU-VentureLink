class Startup {
  final String id;
  final String name;
  final String description;
  final String founderId;
  final String? logo;
  final String? website;
  final List<String> categories;
  final String stage; // 'idea', 'MVP', 'early-stage', 'growth'
  final int followers;
  final bool verified;
  final DateTime createdAt;

  Startup({
    required this.id,
    required this.name,
    required this.description,
    required this.founderId,
    this.logo,
    this.website,
    this.categories = const [],
    required this.stage,
    this.followers = 0,
    this.verified = false,
    required this.createdAt,
  });

  factory Startup.fromJson(Map<String, dynamic> json) {
    return Startup(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      founderId: json['founderId'],
      logo: json['logo'],
      website: json['website'],
      categories: List<String>.from(json['categories'] ?? []),
      stage: json['stage'],
      followers: json['followers'] ?? 0,
      verified: json['verified'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'founderId': founderId,
      'logo': logo,
      'website': website,
      'categories': categories,
      'stage': stage,
      'followers': followers,
      'verified': verified,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
