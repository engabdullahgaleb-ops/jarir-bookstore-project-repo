import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/Screens/splash_screen.dart';
import 'package:jarir_bookstore_project/core/cubits/app_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/remote_data_cubit.dart';
import 'package:jarir_bookstore_project/core/cubits/theme_cubit.dart';
import 'package:jarir_bookstore_project/core/repositories/firestore_repository.dart';
import 'package:jarir_bookstore_project/core/theme/app_theme.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/helpers/locale_helper.dart';
import 'package:jarir_bookstore_project/shared/helpers/theme_mode_helper.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (context)=> AppCubit()),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit(LocaleHelper.getCurrentLocale()),
        ),
        BlocProvider<ThemeCubit>(create: (context)=>ThemeCubit(ThemeModeHelper.getCurrentThemeMode())),

        BlocProvider<RemoteDataCubit>(
          create: (_) => RemoteDataCubit(
            repository: FirestoreRepository(
            ),
          )..loadData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context,state) {

        },
        builder: (context, state) {
          return MaterialApp(
            //debug
            debugShowCheckedModeBanner: false,

            // Localization
            locale: context.watch<LocaleCubit>().state,
            supportedLocales: LocaleHelper.getSupportedLocales(),
            localizationsDelegates:
            AppLocalizations.localizationsDelegates,

            //app title
            onGenerateTitle:(context)=> AppLocalizations.of(context)!.appName,

            //theme
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: context.watch<ThemeCubit>().state==Brightness.light?ThemeMode.light:ThemeMode.dark,

            //home screen
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}