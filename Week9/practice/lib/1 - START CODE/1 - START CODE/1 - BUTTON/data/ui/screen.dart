import 'package:flutter/material.dart';

import '../../model/button_status.dart';
import '../repository/button_repository.dart';
import '../repository/repository_exception.dart';
import 'button.dart';

enum AsyncState { notstarted, loading, error, success }

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  AsyncState state = AsyncState.notstarted;

  ButtonStatus? button;

  String? error;

  @override
  void initState() {
    super.initState();

    _fetchButtonData();
  }

  void _fetchButtonData() async {
    setState(() {
      state = AsyncState.loading;
    });

    try {
      ButtonStatus result = await ButtonRepository.instance.getButtonStatus();

      setState(() {
        button = result;

        state = AsyncState.success;
      });
    } on RepositoryException catch (e) {
      setState(() {
        error = e.message;

        state = AsyncState.error;
      });
    }
  }

  Widget get content {
    switch (state) {
      case AsyncState.notstarted:
        return const Text("Press refresh");

      case AsyncState.loading:
        return const CircularProgressIndicator();

      case AsyncState.error:
        return Text(error!, style: const TextStyle(color: Colors.red));

      case AsyncState.success:
        return StatusButton(
          name: button!.name,

          selected: button!.selected,

          onPressed: () {
            setState(() {
              button = ButtonStatus(
                name: button!.name,

                selected: button!.selected,
              );
            });
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Button")),

      body: Center(child: content),
    );
  }
}
