import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../cubit/cubit.dart';
import 'second.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FlutterSwitch(
              width: 70,
              height: 35.0,
              toggleSize: 25.0,
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
                color: Color.fromARGB(255, 255, 174, 0),
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
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Switched Theme to ' +
                  context
                      .read<ThemeCubit>()
                      .state
                      .theme
                      .toString()
                      .split('.')
                      .last
                      .split(')')
                      .first
                      .toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Text('Click on the switch to change theme to ' +
                (_isChanged ? 'LIGHT' : 'DARK')),
            const SizedBox(height: 16),
            //just rebuild Text widget to see the value change when using StreamSubscription
            // Text(
            //   'Random value: ${context.read<CounterCubit>().state.counterValue}',
            //   style: Theme.of(context).textTheme.headline6,
            // ),

            //just rebuild Text widget to see the value change when using BlocListeners
            BlocListener<ThemeCubit, ThemeState>(
              listener: (context, state) {
                if (state.theme == AppTheme.light) {
                  context.read<CounterCubit>().increment(80);
                } else if (state.theme == AppTheme.dark) {
                  context.read<CounterCubit>().decrement(70);
                }
              },
              child: Text(
                'Random value: ${context.read<CounterCubit>().state.counterValue}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('Move to next page'),
            ),
          ],
        ),
      ),
    );
  }
}
