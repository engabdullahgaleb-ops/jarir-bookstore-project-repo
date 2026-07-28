import 'package:carousel_slider/carousel_controller.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/bottom_navigation_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/remote_data_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/theme_cubit.dart';
import 'package:jarir_bookstore_project/core/models/bottom_nav_item.dart';
import 'package:jarir_bookstore_project/core/theme/app_colors.dart';
import 'package:jarir_bookstore_project/data/mock_data.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/locale_helper.dart';
import 'package:jarir_bookstore_project/shared/helpers/random_colors_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

 final PageController pageController = PageController();
 final CarouselSliderController carouselSliderController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
   return
     Scaffold(
        //app bar
        appBar: getAppBar(context) as AppBar,

        //bottom navigation bar with bloc provider
        bottomNavigationBar: BlocProvider(
          create: (context)=>BottomNavigationCubit(),
          child: BlocBuilder<BottomNavigationCubit,int>(
            builder:(context,state)=> AppBottomNavigationBar(
                context: context,
                currentIndex: context.watch<BottomNavigationCubit>().state,
                onTap: (index){
                  context.read<BottomNavigationCubit>().changeCurrentItem(index);
                },
                itemsData:BottomNavigationCubit.buildBottomNavItemsData(context)
            ),
          ),
        ),

       //body
       body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 5,),
                //search bar
                inputField(context: context,prefix: Icons.search,suffix: Icons.qr_code,type: TextInputType.webSearch,hint: AppLocalizations.of(context)!.toBeSearched),
                SizedBox(height: 10,),
                boundaryLine(),
                SizedBox(height: 15,),

                //categories
                SizedBox(
                  height: 150,
                  child: horizontalListView(
                    count: context.watch<RemoteDataCubit>().state is RemoteDataLoaded?(context.read<RemoteDataCubit>().state as RemoteDataLoaded ).categories.length:10,
                    itemBuilder: (BuildContext context, index) {
                      return  SizedBox(
                        width:150,
                        child: ConditionalBuilder(
                          condition: context.watch<RemoteDataCubit>().state is RemoteDataLoaded,
                          builder:((context){
                           RemoteDataLoaded result = (context.read<RemoteDataCubit>().state as RemoteDataLoaded );
                            return cardItem(
                              color: RandomColorsHelper.random(context),
                              context: context,
                              imageUrl: result.categories[index].imageUrl,
                              title: context.watch<LocaleCubit>().isArabic()?result.categories[index].title['ar']!:result.categories[index].title['en']!,
                          );}),
                          fallback:((error)=> emptyCardItem(context)) ,
                        )
                      );
                    },
                  ),
                ),
                SizedBox(height: 15,),

                //banners slider
                SizedBox(
                  height: 200,
                  child: ConditionalBuilder(
                    condition: context.watch<RemoteDataCubit>().state is RemoteDataLoaded,
                    builder: ((value){
                      RemoteDataLoaded result = context.read<RemoteDataCubit>().state as RemoteDataLoaded;
                      return Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                                controller: pageController, itemCount:result.banners.length,itemBuilder: (context,index) {
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: AppNetworkImage(url: result.banners[index].imageUrl)
                              );
                            }),
                          ),
                          SizedBox(height: 8,),
                          smoothPageIndicator(controller: pageController,
                              count: result.banners.length)
                        ],
                      );
                    }),
                    fallback:((error){
                      return Center(
                        child: CircularProgressIndicator(),
                      ) ;
                    })
                  ),
                ),
              ],
            ),
          )
        )
     );

  }

  //app bar
  Widget getAppBar(BuildContext context){
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
                        child: Text(MockData.getLocation(context),style:Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal),maxLines: 1,overflow: TextOverflow.ellipsis,)),//to be changed , for demo purposes only
                    InkWell(
                        onTap: (){
                          showBottomSheet(context);
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

  
  
  //bottom sheet
  Future<String?> showBottomSheet(BuildContext context){
    return showModalBottomSheet<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context)=>
            SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getModalBottomSheetAppBar(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.chooseDelivery,style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconTitleButton(icon: Icon(Icons.store_outlined,color: AppColors.primary,), title: AppLocalizations.of(context)!.pickupFromJariStore, context: context),
                        SizedBox(width: 20,),
                        iconTitleButton(icon: Icon(Icons.delivery_dining,color: AppColors.primary,), title: AppLocalizations.of(context)!.deliveryToMyLocation, context: context)

                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  // appbar inside bottom sheet
  AppBar getModalBottomSheetAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0, leading: IconButton(icon:Icon(Icons.arrow_back_ios_sharp), onPressed: () {

      },),
      title: Text(AppLocalizations.of(context)!.chooseCity,style:
      Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800,color: AppColors.primary)
        ,),
      actions: [
        IconButton(icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );

  }

}



