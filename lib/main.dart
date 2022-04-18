import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switch/theme_observer.dart';
import 'package:theme_switch/views/home.dart';

import 'cubit/cubit.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: ThemeObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       CounterCubit(themeCubit: BlocProvider.of<ThemeCubit>(context)),
        // ),
        //for using StreamSubscription with instance of ThemeCubit
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) => debugPrint(
          'THEME HAS CHANGED TO ' + state.enumToString(),
        ),
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.theme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(title: 'Theme Switch'),
          );
        },
      ),
    );
  }
}
