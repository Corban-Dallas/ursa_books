import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Account"),
      trailing: TextButton.icon(
          onPressed: () => context.go('/nexus'), label: const Icon(Icons.add)),
      onTap: () => context.go('/account'),
    );
  }
}
