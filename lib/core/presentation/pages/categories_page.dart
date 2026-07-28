import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/remote_data_cubit.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/random_colors_helper.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 15.0,vertical: 3),
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.shoppingByCategory,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Spacer(),
                  InkWell(
                    child:Icon(Icons.search,size: 30,),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            boundaryLine(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                ConditionalBuilder(
                  condition: context.watch<RemoteDataCubit>().state is RemoteDataLoaded,
                  builder:((context){
                    RemoteDataLoaded result = (context.read<RemoteDataCubit>().state as RemoteDataLoaded );
                    return buildGridView(context: context,result.categories,crossAxisCount: 3);
                  }),
                  fallback:((error)=> Center(child: brokenImage())) ,
                  )
              ),
            )
          ],
      ),
    );
  }
}
