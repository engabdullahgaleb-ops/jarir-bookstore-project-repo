import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/navigation_bar_cubit.dart';
import 'package:jarir_bookstore_project/core/models/bottom_nav_item.dart';
import 'package:jarir_bookstore_project/core/theme/app_colors.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/helpers/helpers.dart';
import 'package:jarir_bookstore_project/shared/helpers/random_colors_helper.dart';
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
    color: AppColors.grey300,
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
            SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child:Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppNetworkImage(url: imageUrl,),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text(title,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: context!=null?Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ):TextStyle()),
          ],
        ),
      ),
    ),
  );
}

Widget emptyCardItem(BuildContext context){
  return Card(
    color: getSurfaceColor(context),
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


class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 12,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;

          return Center(
            child: CircularProgressIndicator(
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                  progress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (_, __, ___) => brokenImage(),
      ),
    );
  }
}
Widget brokenImage(){
  return Container(
    color: Colors.grey.shade200,
    alignment: Alignment.center,
    child: const Icon(Icons.broken_image),
  );
}

//bottom navigation bar
class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.itemsData,
    required this.context,
  });

  final BuildContext context ;
  final List<NavItem> itemsData;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onTap,
        destinations: List.generate(itemsData.length, ((index) =>
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context.watch<NavigationBarCubit>().state == index
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
              child: NavigationDestination(
                tooltip: itemsData[index].label,
                icon: itemsData[index].icon,
                selectedIcon: itemsData[index].selectedIcon,
                label: itemsData[index].label,
              ),
            )
        ))
      ),
    );
  }
}

//slider fade animation
Widget slideFadeSwitcher({
    required Key key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0.15, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        );
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: KeyedSubtree(
        key: key,
        child: child,
      ),
    );
  }

//build grid view
Widget buildGridView(List items, {required BuildContext context, int crossAxisCount = 2}) {
  return GridView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1/1.3,
    ),
    itemBuilder: (context, index) {
      final item = items[index];
      return SizedBox(
        child: cardItem(
          context: context,
          imageUrl: item.imageUrl,
          title:  context.watch<LocaleCubit>().isArabic()?item.title['ar']!:item.title['en']!,
          color: RandomColorsHelper.random(context)),
      );
    },
  );
}

//login cart widget
Widget buildLoginCard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 26,
              child: Icon(Icons.person_outline),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcome,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!.signInDescription,
                  ),
                ],
              ),
            )
          ],
        ),
         SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton.icon(
            onPressed: () {},
            icon:  Icon(Icons.login),
            label:  Text(AppLocalizations.of(context)!.signInOrRegister),
          ),
        )
      ],
    ),
  );
}


//tile widget
Widget buildTile({required IconData icon, required String title, Widget? trailing,}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      children: [
        Icon(icon, size: 28),

        const SizedBox(width: 18),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        trailing ??
            const Icon(
              Icons.chevron_right,
              size: 30,
            ),
      ],
    ),
  );
}


//bottom sheet
Future<String?> showAppBottomSheet({required BuildContext context,required String title, String ?subtitle,required List<Widget> children}){
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
                buildAppModalBottomSheetAppBar(context:context,title: title),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subtitle??"",style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
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
AppBar buildAppModalBottomSheetAppBar({required BuildContext context,required String title}){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0, leading: IconButton(icon:Icon(Icons.arrow_back_ios_sharp), onPressed: () {

  },),
    title: Text(title,style:
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

