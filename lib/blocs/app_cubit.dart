import 'package:bloc/bloc.dart';
import 'package:alu_venture_link/models/application.dart';
import 'package:alu_venture_link/models/opportunity.dart';
import 'package:alu_venture_link/models/user_profile.dart';
import 'package:alu_venture_link/services/demo_repository.dart';

class AppState {
  const AppState({
    this.user,
    this.opportunities = const [],
    this.applications = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  final AppUserModel? user;
  final List<OpportunityModel> opportunities;
  final List<OpportunityApplicationModel> applications;
  final bool isLoading;
  final String? errorMessage;

  AppState copyWith({
    AppUserModel? user,
    List<OpportunityModel>? opportunities,
    List<OpportunityApplicationModel>? applications,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AppState(
      user: user ?? this.user,
      opportunities: opportunities ?? this.opportunities,
      applications: applications ?? this.applications,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class AppCubit extends Cubit<AppState> {
  AppCubit({DemoRepository? repository})
      : _repository = repository ?? DemoRepository(),
        super(const AppState());

  final DemoRepository _repository;

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    try {
      final users = await _repository.fetchUsers();
      final user = users.firstWhere(
        (element) => element.role == 'student',
        orElse: () => users.first,
      );
      final opportunities = await _repository.fetchOpportunities();
      final applications = await _repository.fetchApplications();
      emit(state.copyWith(
        user: user,
        opportunities: opportunities,
        applications: applications,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> applyToOpportunity(String opportunityId, String message) async {
    final currentUser = state.user;
    if (currentUser == null) return;

    final application = OpportunityApplicationModel(
      id: 'app-${DateTime.now().millisecondsSinceEpoch}',
      opportunityId: opportunityId,
      studentName: currentUser.name,
      studentEmail: currentUser.email,
      message: message,
    );

    await _repository.submitApplication(application);
    emit(state.copyWith(applications: [...state.applications, application]));
  }

  Future<void> addOpportunity(OpportunityModel opportunity) async {
    await _repository.createOpportunity(opportunity);
    emit(state.copyWith(opportunities: [opportunity, ...state.opportunities]));
  }
}
