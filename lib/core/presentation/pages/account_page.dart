import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/theme_cubit.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/locale_helper.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 15.0,vertical: 3),
            child: Text(AppLocalizations.of(context)!.account,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: 10,),
          boundaryLine(),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      buildLoginCard(context),

                      const SizedBox(height: 24),

                      InkWell(
                        child: buildTile(
                          context: context,
                          icon: Icons.translate,
                          title: AppLocalizations.of(context)!.language,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              context.watch<LocaleCubit>().state.languageCode == SupportedLocaleCodes.ar.name ?const Text('🇸🇦'):Text('🇺🇸'),
                              const SizedBox(width: 8),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          )
                        ),
                        onTap: (){
                          showAppBottomSheet(
                              context: context,
                              title: AppLocalizations.of(context)!.language,
                              subtitle: AppLocalizations.of(context)!.chooseLang,
                              children: [
                                iconTitleButton(
                                    icon: Icon(Icons.language), title: AppLocalizations.of(context)!.arLang,
                                    context: context,
                                    onPressed: (){
                                      Navigator.pop<String>(context,SupportedLocaleCodes.ar.name);
                                    }
                                ),
                                SizedBox(width: 50),
                                iconTitleButton(
                                    icon: Icon(Icons.language), title: AppLocalizations.of(context)!.enLang,
                                    context: context,
                                    onPressed: (){
                                      Navigator.pop<String>(context,SupportedLocaleCodes.en.name);
                                    }
                                ),
                              ]
                          ).then((value){
                            try{
                              value??="";
                              if (kDebugMode) {
                                print(value);
                              }
                              if(value == SupportedLocaleCodes.ar.name) {
                                context.read<LocaleCubit>().changeLocale(
                                    Locale(SupportedLocaleCodes.ar.name));
                              } else if(value == SupportedLocaleCodes.en.name) {
                                context.read<LocaleCubit>().changeLocale(Locale(SupportedLocaleCodes.en.name));
                              }
                            } catch(error){
                              if (kDebugMode) {
                                print(error.toString());

                              }}
                          });
                        },
                      ),


                      InkWell(
                        child: buildTile(
                          context: context,
                          icon: Icons.brightness_4_outlined,
                          title: AppLocalizations.of(context)!.theme,
                          trailing: const Icon(Icons.keyboard_arrow_down),
                        ),
                        onTap: (){
                          showAppBottomSheet(
                              context: context,
                              title: AppLocalizations.of(context)!.theme,
                              subtitle: AppLocalizations.of(context)!.chooseTheme,
                              children: [
                                iconTitleButton(
                                    icon: Icon(Icons.light_mode_outlined), title: AppLocalizations.of(context)!.lightMode,
                                    context: context,
                                    onPressed: (){
                                      Navigator.pop<String>(context,Brightness.light.name); // i want bottom modal to return value
                                    }
                                ),
                                SizedBox(width: 50),
                                iconTitleButton(
                                    icon: Icon(Icons.dark_mode_outlined), title: AppLocalizations.of(context)!.darkMode,
                                    context: context,
                                    onPressed: (){
                                      Navigator.pop<String>(context,Brightness.dark.name);// i want bottom modal to return value
                                    }
                                ),
                              ]
                          ).then((value){
                            try{
                              value??="";
                              if (kDebugMode) {
                                print(value);
                              }
                              if(value == Brightness.light.name) {
                                context.read<ThemeCubit>().changeMode(Brightness.light);
                              } else if (value == Brightness.dark.name) {
                                context.read<ThemeCubit>().changeMode(
                                    Brightness.dark);
                              }
                            } catch(error){
                              if (kDebugMode) {
                                print(error.toString());

                              }}
                          });
                        },
                      ),

                      buildTile(
                        context: context,
                        icon: Icons.receipt_long_outlined,
                        title: AppLocalizations.of(context)!.myOrders,
                      ),

                      buildTile(
                        context: context,
                        icon: Icons.local_offer_outlined,
                        title: AppLocalizations.of(context)!.mySpecialOrders,
                      ),

                      buildTile(
                        context: context,
                        icon: Icons.favorite_border,
                        title: AppLocalizations.of(context)!.wishList,
                      ),

                      buildTile(
                        context: context,
                        icon: Icons.call_outlined,
                        title: AppLocalizations.of(context)!.customCare,
                      ),

                      buildTile(
                        context: context,
                        icon: Icons.headset_mic_outlined,
                        title: AppLocalizations.of(context)!.support,
                      ),

                      buildTile(
                        context: context,
                        icon: Icons.work_outline,
                        title: AppLocalizations.of(context)!.jarirServices,
                      ),
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
