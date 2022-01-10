import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorites_meals_cubit.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/category_filter_cubit.dart';
import '../utils/app_colors.dart';
import '../screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.primary,
      systemNavigationBarColor: AppColors.secondary,
      systemNavigationBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryFilterCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(context.read<CategoryFilterCubit>()),
        ),
        BlocProvider(
          create: (context) => FavoritesMealsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeliMeals App',
        theme: ThemeData(
          primarySwatch: AppColors.primary as MaterialColor,
          canvasColor: AppColors.secondary,
          fontFamily: 'Raleway',
          textTheme: Theme.of(context).textTheme.copyWith(
                headline5: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
