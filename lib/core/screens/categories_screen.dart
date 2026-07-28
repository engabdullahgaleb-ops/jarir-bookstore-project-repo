import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context)!.shoppingByCategory,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              InkWell(
                child:Icon(Icons.search),
              )
            ],
          )
        ],
    );
  }
}
