import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


//button with title and icon
Widget iconTitleButton({required Icon icon, required String title,required BuildContext context,Function ? onPressed }){
  return MaterialButton(
    padding: EdgeInsets.symmetric(horizontal: 2),
    onPressed: (){},
    shape: RoundedRectangleBorder(
      side:BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
    child: Padding(padding: EdgeInsets.all(10),
    child: Row(
      children: [
        icon,
        SizedBox(width: 2,),
        Text(title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800,),)
      ],
    ),),
  );
}
Widget inputField({required BuildContext context,TextEditingController ? controller,TextInputType ?type,IconData ? prefix, IconData ? suffix,String? hint}){
  return TextFormField(
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      suffixIcon: Icon(suffix),
      prefixIcon: Icon(prefix),
      hint: Text(hint??''),
    )

  );
}

Widget boundaryLine(){
  return Container(
    width: double.infinity,
    height: 0.5,
    color: AppColors.grey500,
  );
}

Widget cardItem({ BuildContext ? context ,required String imageUrl, required String title,Color ? color }){
  return Card(
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    elevation: 5,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text(title,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: context!=null?Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ):TextStyle()),
          ],
        ),
      ),
    ),
  );
}

Widget emptyCardItem(){
  return Card(
    color: AppColors.grey300,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    elevation: 5,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

Widget horizontalListView({required int count,itemBuilder}){
  return ListView.separated(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: count,
    separatorBuilder: (_, __) => const SizedBox(width: 5),
    itemBuilder: itemBuilder,
  );
}

PageView pager ({required int count,PageController ? controller, required itemBuilder}){
  return PageView.builder(
    itemBuilder: itemBuilder,
    controller: controller,
    physics: BouncingScrollPhysics(),
    itemCount: count,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}



Widget smoothPageIndicator({required PageController controller,required int count}){
  return SmoothPageIndicator(
    controller: controller,
    count: count,
    effect: ExpandingDotsEffect(
      expansionFactor: 4,
      dotHeight: 10,
      dotWidth: 10,
      activeDotColor: AppColors.primary
    ),
  );
}
Widget carouselSlider({required CarouselSliderController  controller,required items}){
  return CarouselSlider(carouselController: controller,
      options: CarouselOptions(
    autoPlay:true,
  ), items: items,);
}
