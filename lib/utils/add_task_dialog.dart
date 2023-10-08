import 'package:flutter/material.dart';
import 'package:pomodoro_task_timer/component/duration_picker_component.dart';

Future<void> addTaskDialog(BuildContext context,
    Function(String title, Duration duration) submitCallback) {
  final controller = TextEditingController();
  Duration duration = Duration.zero;
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('タスク追加'),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("タイトル"),
                  TextField(controller: controller),
                  const SizedBox(height: 20),
                  DurationPickerComponent(callback: (Duration pickerDuration) {
                    duration = pickerDuration;
                  })
                ]),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge),
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop()),
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Submit'),
                  onPressed: () {
                    submitCallback(controller.text, duration);
                    Navigator.of(context).pop();
                  })
            ]);
      });
}
