import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switch/theme_observer.dart';

import 'cubit/cubit.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: ThemeObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) => debugPrint(
          'THEME HAS CHANGED TO ' +
              state.toString().split('.').last.toUpperCase(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Text(
                  'Switched Theme to ' +
                      state
                          .toString()
                          .split('.')
                          .last
                          .split(')')
                          .first
                          .toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterSwitch(
                width: 100.0,
                height: 55.0,
                toggleSize: 45.0,
                borderRadius: 30.0,
                padding: 2.0,
                activeToggleColor: const Color.fromARGB(255, 71, 34, 145),
                inactiveToggleColor: const Color.fromARGB(255, 219, 225, 231),
                activeSwitchBorder: Border.all(
                  color: const Color(0xFF3C1E70),
                  width: 5.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: const Color(0xFFD1D5DA),
                  width: 5.0,
                ),
                activeColor: const Color.fromARGB(255, 23, 10, 49),
                inactiveColor: Colors.white,
                activeIcon: const Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFF8E3A1),
                ),
                inactiveIcon: const Icon(
                  Icons.sunny,
                  color: Color.fromARGB(255, 241, 198, 24),
                ),
                value: _isChanged,
                onToggle: (status) {
                  setState(() {
                    _isChanged = status;
                  });
                  context.read<ThemeCubit>().switchTheme(status);
                },
              ),
            ),
            const SizedBox(height: 16),
            Text('Click on the switch to change theme to ' +
                (_isChanged ? 'LIGHT' : 'DARK')),
          ],
        ),
      ),
    );
  }
}
