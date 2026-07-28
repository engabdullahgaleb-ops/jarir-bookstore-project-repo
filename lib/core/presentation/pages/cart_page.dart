import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.cartPage,style:
        Theme.of(context).textTheme.headlineMedium
        ,),
    );
  }
}
