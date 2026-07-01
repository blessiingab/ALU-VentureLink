import 'package:alu_venture_link/models/opportunity.dart';
import 'package:flutter/material.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({super.key, required this.opportunity, required this.onApply});

  final OpportunityModel opportunity;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    opportunity.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (opportunity.isFeatured)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text('Featured'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(opportunity.startupName, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(opportunity.description),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _chip(context, opportunity.location),
                _chip(context, opportunity.sector),
                _chip(context, opportunity.stipend),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: Text('Skills: ${opportunity.skills}')),
                FilledButton(onPressed: onApply, child: const Text('Apply')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
