import 'package:flutter/material.dart';

class EmptyStateView extends StatelessWidget {
  final String message;
  final String? illustrationPath;

  const EmptyStateView({
    super.key,
    required this.message,
    this.illustrationPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (illustrationPath != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Image.asset(illustrationPath!, height: 200),
              )
            else
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Icon(Icons.inbox_outlined, size: 80, color: Colors.grey),
              ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
