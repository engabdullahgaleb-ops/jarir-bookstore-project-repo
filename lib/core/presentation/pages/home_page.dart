import 'package:carousel_slider/carousel_controller.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/remote_data_cubit.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/random_colors_helper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController pageController = PageController();
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                //search bar
                inputField(context: context,prefix: Icons.search,suffix: Icons.qr_code,type: TextInputType.webSearch,hint: AppLocalizations.of(context)!.toBeSearched),
                SizedBox(height: 10,),
                boundaryLine(),
                SizedBox(height: 15,),

                //categories
                Container(
                  margin: EdgeInsetsDirectional.only(top: 5),
                  child: SizedBox(
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
                                return buildImageLabelCardItem(
                                  color: RandomColorsHelper.random(context),
                                  context: context,
                                  imageUrl: result.categories[index].imageUrl,
                                  title: context.watch<LocaleCubit>().isArabic()?result.categories[index].title['ar']!:result.categories[index].title['en']!,
                                );}),
                              fallback:((error)=> emptyCardItem()) ,
                            )
                        );
                      },
                    ),
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

                SizedBox(height: 15,),

                //banner
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: ConditionalBuilder(
                    condition: context.watch<RemoteDataCubit>().state is RemoteDataLoaded,
                    builder: ((value) {
                      RemoteDataLoaded result = context
                          .read<RemoteDataCubit>()
                          .state as RemoteDataLoaded;
                      return  AppNetworkImage(url: result.assets[0].banner);
                      }),
                      fallback:((error){
                          return Center(
                          child: CircularProgressIndicator(),
                      );
                    })
                  )),
                ),

                SizedBox(height: 15,),

                //brands
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.shoppingByBrand, style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500)),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 80,
                      child: horizontalListView(
                        spacing: 5,
                        count: context.watch<RemoteDataCubit>().state is RemoteDataLoaded?(context.read<RemoteDataCubit>().state as RemoteDataLoaded ).brands.length:10,
                        itemBuilder: (BuildContext context, index) {
                          return  SizedBox(
                              width:150,
                              child: ConditionalBuilder(
                                condition: context.watch<RemoteDataCubit>().state is RemoteDataLoaded,
                                builder:((context){
                                  RemoteDataLoaded result = (context.read<RemoteDataCubit>().state as RemoteDataLoaded );
                                  return Tooltip(
                                      message: context.watch<LocaleCubit>().isArabic()?result.brands[index].title['ar']!:result.brands[index].title['en']!,
                                      child: buildImageCardItem(width :200,height:60,imageUrl: result.brands[index].imageUrl));
                                  }),
                                fallback:((error)=> emptyCardItem()) ,
                              )
                          );
                        },
                      )
                    )
                  ],
                )


              ],
            ),
          ),
        )
    );
  }
}
