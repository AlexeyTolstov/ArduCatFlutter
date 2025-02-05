import 'package:ArduinoSimulator/data/device_data.dart';
import 'package:ArduinoSimulator/data/device_different.dart';
import 'package:ArduinoSimulator/data/main_data_provider.dart';
import 'package:ArduinoSimulator/styles/app_styles.dart';
import 'package:ArduinoSimulator/utils/drag_anchor_strategy.dart';
import 'package:ArduinoSimulator/utils/operations.dart';
import 'package:ArduinoSimulator/widgets/device_item_widget.dart';
import 'package:flutter/material.dart';

class DeviceViewWidget extends StatefulWidget {
  const DeviceViewWidget({super.key});

  @override
  State<DeviceViewWidget> createState() => _DeviceViewWidgetState();
}

class _DeviceViewWidgetState extends State<DeviceViewWidget> {
  List<Widget> deviceItems(context) {
    final mainDataProvider = MainDataProvider.of(context);
    final List<DeviceData> deviceList = mainDataProvider.deviceList;
    
    Map<String, DeviceDifferent> diffDevices =
        deviceList.fold({}, (acc, deviceData) {
      final deviceName = deviceData.name;
      final deviceDifferent =
          acc.putIfAbsent(deviceName, () => DeviceDifferent());

      (deviceData.isDropped)
          ? deviceDifferent.notUsing++
          : deviceDifferent.using++;

      return acc;
    });

    Set<String> usingDevices = {};
    List<Widget> result = [];

    for (DeviceData deviceData in deviceList) {
      final String deviceName = deviceData.name;
      final DeviceDifferent deviceDifferent = diffDevices[deviceData.name]!;

      final bool isRender = deviceDifferent.notUsing < deviceDifferent.total &&
          !usingDevices.contains(deviceName) &&
          !deviceData.isDropped;

      if (isRender) {
        usingDevices.add(deviceName);

        result.add(Draggable<DeviceData>(
          dragAnchorStrategy: dragAnchorStrategy(deviceData.width, deviceData.height),
          onDragEnd: (details) {
            DeviceData devData = deviceList.firstWhere(
              (DeviceData d) => d.id == deviceData.id);

            devData.x = details.offset.dx - ApplicationStyles.widthTaskDeviceRow;
            devData.y = details.offset.dy;

            devData.isDropped = isBetween(0, devData.image.width!, devData.x) &&
                isBetween(0, devData.image.height!, devData.y);

            mainDataProvider.updateData();
          },
          feedback: deviceData.image,
          childWhenDragging: const SizedBox(
            width: 275,
            height: 100,
          ),
          child: DeviceItemWidget(
            image: deviceData.image,
            title: deviceData.name,
            n: deviceDifferent.using,
            maxN: deviceDifferent.total,
            onTap: () {
              for (final element in deviceList) {
                if (element.name == deviceName) {
                  element.isDropped = false;
                }
              }
              mainDataProvider.updateData();
            },
          ),
        ));
      }
    }
    final Set<String> emptyDevices = diffDevices.entries
      .where((entry) => entry.value.using == 0)
      .map((entry) => entry.key).toSet();

    List<DeviceData> usingListDevices =
        deviceList.where((element) => element.isDropped).toList();

    for (DeviceData deviceData in usingListDevices) {
      final String deviceName = deviceData.name;

      final bool isValid = !usingDevices.contains(deviceName) &&
        emptyDevices.contains(deviceName);

      if (isValid) {
        usingDevices.add(deviceName);

        result.add(
          DeviceItemWidget(
            image: deviceData.image,
            title: deviceName,
            n: diffDevices[deviceName]!.using,
            maxN: diffDevices[deviceName]!.total,
            onTap: () {
              for (final element in deviceList) {
                if (element.name == deviceName) {
                  element.isDropped = false;
                }
              }
              mainDataProvider.updateData();
            },
          ),
        );
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: ApplicationStyles.heightTaskWidget,
        width: double.infinity,
        color: ApplicationStyles.applicationColors.textBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  childAspectRatio: 2.75,
                  children: deviceItems(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
