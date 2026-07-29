import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/navigation_bar_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/theme_cubit.dart';
import 'package:jarir_bookstore_project/core/theme/app_colors.dart';
import 'package:jarir_bookstore_project/data/mock_data.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/locale_helper.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return
     BlocProvider<NavigationBarCubit>(
       create: (context)=>NavigationBarCubit(),
       child: BlocBuilder<NavigationBarCubit,int>(
       builder:(context,state)=>  Scaffold(
          //app bar
          appBar: state == 0 ? buildAppBar(context) as AppBar:null,

          //bottom navigation
          bottomNavigationBar:AppNavigationBar(
            context: context,
            currentIndex: context.watch<NavigationBarCubit>().state,
            onTap: (index){
              context.read<NavigationBarCubit>().changePage(index);
            },
            itemsData:NavigationBarCubit.buildNavItemsData(context)
          ),
         //body
         body: slideFadeSwitcher(
         child: NavigationBarCubit.getPages()[state],
       ),
      ),
     ));
  }

  //app bar
  Widget buildAppBar(BuildContext context){
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
              height: 50,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.welcome, style:theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
                  Row(children: [
                    Icon(Icons.location_pin),
                    SizedBox(width: 5,),
                    Expanded(
                        child: Text(MockData.getLocation(context),style:theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,)),//to be changed , for demo purposes only
                    InkWell(
                        onTap: (){
                          showAppBottomSheet(context: context, title: l10n.chooseCity, subtitle: l10n.chooseDelivery,children: [
                            iconTitleButton(icon: Icon(Icons.store_outlined,color: AppColors.primary,), title: l10n.pickupFromJariStore, context: context),
                            SizedBox(width: 20,),
                            iconTitleButton(icon: Icon(Icons.delivery_dining,color: AppColors.primary,), title: l10n.deliveryToMyLocation, context: context)
                          ]);
                        },
                        child: Icon(Icons.keyboard_arrow_down)
                    ),
                  ],),
                  SizedBox(height: 5,)
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<LocaleCubit>().changeLocale(
              LocaleHelper.toggle(context.read<LocaleCubit>().state),
            );
          },
          child: slideFadeSwitcher(
            child: Text(
              context.watch<LocaleCubit>().state.languageCode ==
                  SupportedLocaleCodes.en.name
                  ? 'AR'
                  : 'EN',
              style: TextStyle(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().toggle();
          },

          icon: slideFadeSwitcher(
            child: Icon(
              context.watch<ThemeCubit>().state == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode,
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }

}



