import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/theme_cubit.dart';
import 'package:jarir_bookstore_project/core/presentation/screens/register_screen.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/helpers.dart';
import 'package:jarir_bookstore_project/shared/helpers/locale_helper.dart';

import '../screens/login_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 15.0,
              vertical: 3,
            ),
            child: Text(l10n.account, style: theme.textTheme.headlineSmall),
          ),
          SizedBox(height: 10),
          boundaryLine(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    buildLoginCard(
                      context: context,
                      onLoginButtonPressed: () {
                        //context.read<AuthCubit>().signInWithGoogle();
                        navigateTo(from: context, to: LoginScreen());
                      },
                    ),

                    const SizedBox(height: 24),

                    InkWell(
                      child: buildTile(
                        context: context,
                        icon: Icons.translate,
                        title: l10n.language,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            context.watch<LocaleCubit>().state.languageCode ==
                                    SupportedLocaleCodes.ar.name
                                ? const Text('Ar')
                                : Text('En'),
                            const SizedBox(width: 8),
                            const Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                      onTap: () {
                        showAppBottomSheet(
                          context: context,
                          title: l10n.language,
                          subtitle: l10n.chooseLang,
                          children: [
                            iconTitleButton(
                              icon: Icon(Icons.language),
                              title: l10n.arLang,
                              context: context,
                              onPressed: () {
                                Navigator.pop<String>(
                                  context,
                                  SupportedLocaleCodes.ar.name,
                                );
                              },
                            ),
                            SizedBox(width: 50),
                            iconTitleButton(
                              icon: Icon(Icons.language),
                              title: l10n.enLang,
                              context: context,
                              onPressed: () {
                                Navigator.pop<String>(
                                  context,
                                  SupportedLocaleCodes.en.name,
                                );
                              },
                            ),
                          ],
                        ).then((value) {
                          try {
                            value ??= "";
                            if (kDebugMode) {
                              print(value);
                            }
                            if (value == SupportedLocaleCodes.ar.name) {
                              context.read<LocaleCubit>().changeLocale(
                                Locale(SupportedLocaleCodes.ar.name),
                              );
                            } else if (value == SupportedLocaleCodes.en.name) {
                              context.read<LocaleCubit>().changeLocale(
                                Locale(SupportedLocaleCodes.en.name),
                              );
                            }
                          } catch (error) {
                            if (kDebugMode) {
                              print(error.toString());
                            }
                          }
                        });
                      },
                    ),

                    InkWell(
                      child: buildTile(
                        context: context,
                        icon: Icons.brightness_4_outlined,
                        title: l10n.theme,
                        trailing: const Icon(Icons.keyboard_arrow_down),
                      ),
                      onTap: () {
                        showAppBottomSheet(
                          context: context,
                          title: l10n.theme,
                          subtitle: l10n.chooseTheme,
                          children: [
                            iconTitleButton(
                              icon: Icon(Icons.light_mode_outlined),
                              title: l10n.lightMode,
                              context: context,
                              onPressed: () {
                                Navigator.pop<String>(
                                  context,
                                  Brightness.light.name,
                                ); // i want bottom modal to return value
                              },
                            ),
                            SizedBox(width: 50),
                            iconTitleButton(
                              icon: Icon(Icons.dark_mode_outlined),
                              title: l10n.darkMode,
                              context: context,
                              onPressed: () {
                                Navigator.pop<String>(
                                  context,
                                  Brightness.dark.name,
                                ); // i want bottom modal to return value
                              },
                            ),
                          ],
                        ).then((value) {
                          try {
                            value ??= "";
                            if (kDebugMode) {
                              print(value);
                            }
                            if (value == Brightness.light.name) {
                              context.read<ThemeCubit>().changeMode(
                                Brightness.light,
                              );
                            } else if (value == Brightness.dark.name) {
                              context.read<ThemeCubit>().changeMode(
                                Brightness.dark,
                              );
                            }
                          } catch (error) {
                            if (kDebugMode) {
                              print(error.toString());
                            }
                          }
                        });
                      },
                    ),

                    buildTile(
                      context: context,
                      icon: Icons.receipt_long_outlined,
                      title: l10n.myOrders,
                    ),

                    buildTile(
                      context: context,
                      icon: Icons.local_offer_outlined,
                      title: l10n.mySpecialOrders,
                    ),

                    buildTile(
                      context: context,
                      icon: Icons.favorite_border,
                      title: l10n.wishList,
                    ),

                    buildTile(
                      context: context,
                      icon: Icons.call_outlined,
                      title: l10n.customCare,
                    ),

                    buildTile(
                      context: context,
                      icon: Icons.headset_mic_outlined,
                      title: l10n.support,
                    ),

                    buildTile(
                      context: context,
                      icon: Icons.work_outline,
                      title: l10n.jarirServices,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
