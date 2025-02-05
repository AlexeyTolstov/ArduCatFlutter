import 'package:ArduinoSimulator/styles/app_styles.dart';
import 'package:ArduinoSimulator/widgets/device_view_widget.dart';
import 'package:ArduinoSimulator/widgets/task_desc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskDeviceRowWidget extends StatefulWidget {
  const TaskDeviceRowWidget({super.key});

  @override
  State<TaskDeviceRowWidget> createState() => _TaskDeviceRowWidgetState();
}

class _TaskDeviceRowWidgetState extends State<TaskDeviceRowWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: ApplicationStyles.widthTaskDeviceRow,
      child: Column(
        children: [
          TaskDescWidget(),
          SizedBox(height: 5),
          DeviceViewWidget(),
        ],
      ),
    );
  }
}