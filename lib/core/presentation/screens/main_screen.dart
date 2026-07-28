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
           key: ValueKey(state),
         child: NavigationBarCubit.getPages()[state],
       ),
      ),
     ));
  }

  //app bar
  Widget buildAppBar(BuildContext context){
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
                  Text(AppLocalizations.of(context)!.welcome, style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
                  Row(children: [
                    Icon(Icons.location_pin),
                    SizedBox(width: 5,),
                    Expanded(
                        child: Text(MockData.getLocation(context),style:Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,)),//to be changed , for demo purposes only
                    InkWell(
                        onTap: (){
                          showAppBottomSheet(context: context, title: AppLocalizations.of(context)!.chooseCity, subtitle: AppLocalizations.of(context)!.chooseDelivery,children: [
                            iconTitleButton(icon: Icon(Icons.store_outlined,color: AppColors.primary,), title: AppLocalizations.of(context)!.pickupFromJariStore, context: context),
                            SizedBox(width: 20,),
                            iconTitleButton(icon: Icon(Icons.delivery_dining,color: AppColors.primary,), title: AppLocalizations.of(context)!.deliveryToMyLocation, context: context)
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
        TextButton(child:
            Text(context.watch<LocaleCubit>().state.languageCode==SupportedLocaleCodes.en.name?SupportedLocaleCodes.ar.name.toUpperCase():SupportedLocaleCodes.en.name.toUpperCase()
            ,style: TextStyle(color: AppColors.primary),),
         onPressed: () {
           context.read<LocaleCubit>().changeLocale(LocaleHelper.toggle(
               context.read<LocaleCubit>().state
           ));
         },),
        IconButton(onPressed: (){
          context.read<ThemeCubit>().toggle();
        },
        icon: Icon(context.watch<ThemeCubit>().state.name==Brightness.light.name?
          Icons.dark_mode_outlined:Icons.light_mode,
          color: AppColors.primary,
        ),
        )
      ],
    );
  }

}



