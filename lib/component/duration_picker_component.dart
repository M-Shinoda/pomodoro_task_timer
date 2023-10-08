import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DurationPickerComponent extends HookWidget {
  final Function(Duration duration) callback;

  const DurationPickerComponent({required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    final duration = useState<Duration>(Duration.zero);
    return DurationPicker(
        duration: duration.value,
        onChange: (val) {
          duration.value = val;
          callback(val);
        },
        snapToMins: 5.0);
  }
}
