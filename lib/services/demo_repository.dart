import 'package:alu_venture_link/models/application.dart';
import 'package:alu_venture_link/models/opportunity.dart';
import 'package:alu_venture_link/models/user_profile.dart';

class DemoRepository {
  DemoRepository() {
    _seedData();
  }

  final List<OpportunityModel> _opportunities = [];
  final List<AppUserModel> _users = [];
  final List<OpportunityApplicationModel> _applications = [];

  void _seedData() {
    _users.addAll([
      const AppUserModel(
        id: 'student-1',
        name: 'Aline Uwase',
        email: 'aline@alueducation.org',
        role: 'student',
        bio: 'Aspiring product designer with a passion for user research.',
        campus: 'Kigali',
        interests: 'UX Research, Figma, Design Systems',
      ),
      const AppUserModel(
        id: 'startup-1',
        name: 'Mugisha N.',
        email: 'mugisha@greenpath.org',
        role: 'startup',
        bio: 'Building climate-tech products that support student entrepreneurs.',
        campus: 'Kigali',
        interests: 'Software, Marketing, Research',
        startupName: 'GreenPath Labs',
        verified: true,
      ),
    ]);

    _opportunities.addAll([
      const OpportunityModel(
        id: 'opp-1',
        title: 'Mobile App Intern',
        startupName: 'GreenPath Labs',
        description: 'Help build a student-focused sustainability platform and ship a polished MVP.',
        location: 'Kigali',
        stipend: 'Paid internship',
        deadline: '2026-07-25',
        skills: 'Flutter, UI/UX, Firebase',
        sector: 'Software',
        createdBy: 'startup-1',
        isFeatured: true,
        appliedCount: 8,
      ),
      const OpportunityModel(
        id: 'opp-2',
        title: 'Community Growth Assistant',
        startupName: 'ALU Makers',
        description: 'Support community onboarding and create engaging content for student founders.',
        location: 'Remote',
        stipend: 'Volunteer + certificate',
        deadline: '2026-07-20',
        skills: 'Content Creation, Community Management',
        sector: 'Community',
        createdBy: 'startup-1',
        appliedCount: 4,
      ),
    ]);
  }

  Future<List<OpportunityModel>> fetchOpportunities() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return List<OpportunityModel>.from(_opportunities);
  }

  Future<List<AppUserModel>> fetchUsers() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return List<AppUserModel>.from(_users);
  }

  Future<void> submitApplication(OpportunityApplicationModel application) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _applications.add(application);
  }

  Future<List<OpportunityApplicationModel>> fetchApplications() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return List<OpportunityApplicationModel>.from(_applications);
  }

  Future<void> createOpportunity(OpportunityModel opportunity) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _opportunities.insert(0, opportunity);
  }
}
