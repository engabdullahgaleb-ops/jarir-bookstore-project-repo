import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';

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

                      buildTile(
                        icon: Icons.public,
                        title: AppLocalizations.of(context)!.country,
                        trailing: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('🇸🇦'),
                            SizedBox(width: 8),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),

                      buildTile(
                        icon: Icons.translate,
                        title: AppLocalizations.of(context)!.language,
                        trailing: const Icon(Icons.keyboard_arrow_down),
                      ),

                      buildTile(icon: Icons.brightness_4_outlined,
                        title: AppLocalizations.of(context)!.theme,
                        trailing: IconButton(icon:const Icon(Icons.keyboard_arrow_down),
                          onPressed: (){
                            showAppBottomSheet(
                                context: context,
                                title: AppLocalizations.of(context)!.theme,
                                subtitle: ,
                                children: null)
                          }
                        ,),
                      ),

                      buildTile(
                        icon: Icons.receipt_long_outlined,
                        title: AppLocalizations.of(context)!.myOrders,
                      ),

                      buildTile(
                        icon: Icons.local_offer_outlined,
                        title: AppLocalizations.of(context)!.mySpecialOrders,
                      ),

                      buildTile(
                        icon: Icons.favorite_border,
                        title: AppLocalizations.of(context)!.wishList,
                      ),

                      buildTile(
                        icon: Icons.call_outlined,
                        title: AppLocalizations.of(context)!.customCare,
                      ),

                      buildTile(
                        icon: Icons.headset_mic_outlined,
                        title: AppLocalizations.of(context)!.support,
                      ),

                      buildTile(
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
