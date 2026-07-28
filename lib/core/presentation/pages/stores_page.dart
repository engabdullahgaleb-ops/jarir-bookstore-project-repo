import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

class StoresPage extends StatelessWidget {
  const StoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.storesPage,style:
      Theme.of(context).textTheme.headlineMedium
        ,),
    );
  }
}
