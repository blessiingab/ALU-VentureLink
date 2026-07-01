import 'package:alu_venture_link/blocs/app_cubit.dart';
import 'package:alu_venture_link/models/opportunity.dart';
import 'package:alu_venture_link/widgets/opportunity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('ALU VentureLink'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bridge your skills to real ALU startup opportunities', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      const Text('Discover internships, join verified ventures, and grow your experience within the ALU ecosystem.'),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: () => _showCreateOpportunitySheet(context),
                        icon: const Icon(Icons.add),
                        label: const Text('Post an opportunity'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Open opportunities', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ...state.opportunities.map((opportunity) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: OpportunityCard(
                      opportunity: opportunity,
                      onApply: () => _showApplySheet(context, opportunity),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  void _showApplySheet(BuildContext context, OpportunityModel opportunity) {
    final messageController = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Apply to ${opportunity.title}', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text('Share why you are a strong fit and what you hope to contribute.'),
              const SizedBox(height: 12),
              TextField(
                controller: messageController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Write your motivation...'),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () async {
                  await context.read<AppCubit>().applyToOpportunity(opportunity.id, messageController.text);
                  if (context.mounted) {
                    Navigator.pop(sheetContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Application submitted successfully.')),
                    );
                  }
                },
                child: const Text('Submit application'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCreateOpportunitySheet(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final skillsController = TextEditingController();
    final locationController = TextEditingController(text: 'Kigali');
    final stipendController = TextEditingController(text: 'Stipend available');

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Post a new opportunity', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
                const SizedBox(height: 8),
                TextField(controller: descriptionController, maxLines: 3, decoration: const InputDecoration(labelText: 'Description')),
                const SizedBox(height: 8),
                TextField(controller: skillsController, decoration: const InputDecoration(labelText: 'Skills')),
                const SizedBox(height: 8),
                TextField(controller: locationController, decoration: const InputDecoration(labelText: 'Location')),
                const SizedBox(height: 8),
                TextField(controller: stipendController, decoration: const InputDecoration(labelText: 'Stipend')),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () async {
                    final opportunity = OpportunityModel(
                      id: 'opp-${DateTime.now().millisecondsSinceEpoch}',
                      title: titleController.text,
                      startupName: 'Your Startup',
                      description: descriptionController.text,
                      location: locationController.text,
                      stipend: stipendController.text,
                      deadline: '2026-08-01',
                      skills: skillsController.text,
                      sector: 'Innovation',
                      createdBy: 'startup-1',
                      isFeatured: true,
                    );
                    await context.read<AppCubit>().addOpportunity(opportunity);
                    if (context.mounted) {
                      Navigator.pop(sheetContext);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Opportunity posted.')));
                    }
                  },
                  child: const Text('Publish opportunity'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
