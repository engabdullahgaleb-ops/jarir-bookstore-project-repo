import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Text(l10n.cartPage,style:
        theme.textTheme.headlineMedium
        ,),
    );
  }
}
