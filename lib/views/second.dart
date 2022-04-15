import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:theme_switch/cubit/cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Theme ' +
                context
                    .read<ThemeCubit>()
                    .state
                    .theme
                    .toString()
                    .split('.')
                    .last
                    .split(')')
                    .first,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 16),
          Text(
            context.read<CounterCubit>().state.counterValue.toString(),
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      )),
    );
  }
}
