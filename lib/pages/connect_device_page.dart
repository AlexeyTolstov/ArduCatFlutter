import 'package:ArduinoSimulator/data/main_data.dart';
import 'package:ArduinoSimulator/data/main_data_provider.dart';
import 'package:ArduinoSimulator/data/wire.dart';
import 'package:ArduinoSimulator/devices/contact_names.dart';
import 'package:ArduinoSimulator/devices/device_models/arduino_uno_device.dart';
import 'package:ArduinoSimulator/devices/device_models/light_device.dart';
import 'package:ArduinoSimulator/styles/app_styles.dart';
import 'package:ArduinoSimulator/widgets/drop_device_widget.dart';
import 'package:ArduinoSimulator/widgets/task_device_row_widget.dart';
import 'package:flutter/material.dart';


class ConnectDevicePage extends StatefulWidget {
  const ConnectDevicePage({super.key});

  @override
  State<ConnectDevicePage> createState() => _ConnectDevicePageState();
}

class _ConnectDevicePageState extends State<ConnectDevicePage> {
  final deviceList = [
    LightRed(),
    LightRed(),
    LightRed(),
    ArduinoUno(allowedContactsList: [
      ContactNames.cGND,
      ContactNames.cD13,
    ]),
  ];

  final List<Wire> wireList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationStyles.applicationColors.dropDeviceBackgroundColor,
      body: MainDataProvider(
        notifier: MainData(
          deviceList: deviceList,
          wireList: wireList,
          updateData: () {
            setState(() { });
          },
          onComplete: () {
            print("Complete");
            setState(() {
              
            });
          },
          onReset: () {
            setState(
              () {
                for (final device in deviceList) {
                  device.isDropped = false;
                }
                wireList.clear();
              } 
            );
            
            print("RESET");
          }
        ),
        child: const Row(
          children: [
            TaskDeviceRowWidget(),
            DropDeviceWidget()
          ],
        ),
      )
    );
  }
}