import 'package:alu_venture_link/blocs/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          appBar: AppBar(title: const Text('My profile')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text(user.email),
                      const SizedBox(height: 8),
                      Chip(label: Text(user.role == 'student' ? 'Student' : 'Startup')),
                      const SizedBox(height: 12),
                      Text(user.bio),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Skills & interests', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(user.interests),
              const SizedBox(height: 16),
              Text('Applications', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ...state.applications.map((application) => ListTile(
                    title: Text('Application ${application.id}'),
                    subtitle: Text(application.message),
                    trailing: Chip(label: Text(application.status.toUpperCase())),
                  )),
            ],
          ),
        );
      },
    );
  }
}
