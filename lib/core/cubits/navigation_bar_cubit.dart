import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/models/bottom_nav_item.dart';
import 'package:jarir_bookstore_project/core/presentation/pages/account_page.dart';
import 'package:jarir_bookstore_project/core/presentation/pages/cart_page.dart';
import 'package:jarir_bookstore_project/core/presentation/pages/categories_page.dart';
import 'package:jarir_bookstore_project/core/presentation/pages/home_page.dart';
import 'package:jarir_bookstore_project/core/presentation/pages/stores_page.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }

  static List<NavItem> buildNavItemsData(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      NavItem(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: l10n.home,
      ),
      NavItem(
        icon: Icon(Icons.grid_view_outlined),
        selectedIcon: Icon(Icons.grid_view_rounded),
        label: l10n.category,
      ),
      NavItem(
        icon: Icon(Icons.storefront_outlined),
        selectedIcon: Icon(Icons.storefront_rounded),
        label: l10n.stores,
      ),
      NavItem(
        icon: Icon(Icons.shopping_cart_outlined),
        selectedIcon: Icon(Icons.shopping_cart),
        label: l10n.cart,
      ),
      NavItem(
        icon: Icon(Icons.account_circle_outlined),
        selectedIcon: Icon(Icons.account_circle),
        label: l10n.account,
      ),
    ];
  }

  static List<Widget> getPages() {
    return [
      HomePage(),
      CategoriesPage(),
      StoresPage(),
      CartPage(),
      AccountPage(),
    ];
  }
}
