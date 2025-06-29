import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/themes.dart';
import 'package:todo/feture/choose_mode/presentation/bloc/theme_bloc.dart';
import 'package:todo/feture/choose_mode/presentation/bloc/theme_state.dart';
import 'package:todo/feture/choose_mode/presentation/pages/choose_theme.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(720, 1640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'to do',
                debugShowCheckedModeBanner: false,
                theme: state.themeData,
                home: ChooseModePage(),
              );
            },
          );
        });
  }
}
