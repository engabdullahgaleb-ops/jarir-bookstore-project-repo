import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/models/bottom_nav_item.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

class BottomNavigationCubit extends Cubit<int>{
  BottomNavigationCubit():super(0);

  void changeCurrentItem(int index){
    emit(index);
  }

  static List<BottomNavItem> buildBottomNavItemsData(BuildContext context){
    return [
      BottomNavItem(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: AppLocalizations.of(context)!.home),
      BottomNavItem(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view_rounded), label: AppLocalizations.of(context)!.category),
      BottomNavItem(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront_rounded), label: AppLocalizations.of(context)!.stores),
      BottomNavItem(icon: Icon(Icons.shopping_cart_outlined), selectedIcon: Icon(Icons.shopping_cart), label: AppLocalizations.of(context)!.cart),
      BottomNavItem(icon: Icon(Icons.account_circle_outlined), selectedIcon: Icon(Icons.account_circle), label: AppLocalizations.of(context)!.account),
    ];
  }
}