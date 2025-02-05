import 'package:ArduinoSimulator/data/identifications/point_id.dart';
import 'package:ArduinoSimulator/data/main_data.dart';
import 'package:ArduinoSimulator/data/mixins/point_position.dart';
import 'package:ArduinoSimulator/data/wire.dart';
import 'package:flutter/material.dart';

import 'package:ArduinoSimulator/data/contact_data.dart';
import 'package:ArduinoSimulator/data/device_data.dart';
import 'package:ArduinoSimulator/data/main_data_provider.dart';

import 'package:ArduinoSimulator/widgets/contacts_hiden_panel.dart';
import 'package:ArduinoSimulator/widgets/custom_icon_button.dart';

import 'package:ArduinoSimulator/styles/app_styles.dart';
import 'package:ArduinoSimulator/utils/operations.dart';


class DropDeviceWidget extends StatefulWidget {
  const DropDeviceWidget({super.key});

  @override
  State<DropDeviceWidget> createState() => _DropDeviceWidgetState();
}

class _DropDeviceWidgetState extends State<DropDeviceWidget> {
  /// InheritedWidget
  MainData? mainDataProvider;
  List<DeviceData>? _listDevices;
  List<Wire>? _wireList;

  /// States
  ContactData? _selectedContactData;
  PointId? _pointDraggedId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    mainDataProvider ??= MainDataProvider.of(context);
    _listDevices ??= mainDataProvider!.deviceList;
    _wireList ??= mainDataProvider!.wireList;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onContactClick(ContactData contactData) {
    /// Function `onContactClick` is called when click on contact

    setState(() {
      if (_selectedContactData == null) {
        _selectedContactData = contactData;
      } else if (_selectedContactData == contactData ||
          _selectedContactData!.device == contactData.device) {
        _selectedContactData = null;
      } else {
        _wireList!.add(Wire(_selectedContactData!, contactData));

        _selectedContactData = null;
      }
    });
  }

  List<Positioned> wiresWidgetList() {
    List<Positioned> widgets = [];

    for (Wire wire in _wireList!) {
      for (int i = 0; i < wire.listPoints.length - 1; i++) {
        final first = wire.listPoints[i];
        final last = wire.listPoints[i + 1];

        Positioned widget = Positioned(
          left: first.x + 3,
          top: first.y + 6,
          child: Transform.rotate(
            angle: Wire.angle(first, last),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onPanStart: (DragStartDetails details) {
                final globalPos = details.globalPosition;
                final tapX =
                    globalPos.dx - ApplicationStyles.widthTaskDeviceRow;
                final tapY = globalPos.dy;
                final clickPos = PointPosition(tapX, tapY);

                setState(() {
                  for (int k = 0; k < wire.listPoints.length; k++) {
                    final item = wire.listPoints[k];

                    if (item.id == first.id) {
                      wire.listPoints.insert(
                        ++k,
                        clickPos,
                      );
                      break;
                    }
                  }
                  _pointDraggedId = clickPos.id;
                });
              },
              onPanUpdate: (DragUpdateDetails details) {
                final globalPosition = details.globalPosition;
                final tapX =
                    globalPosition.dx - ApplicationStyles.widthTaskDeviceRow;
                final tapY = globalPosition.dy;

                setState(() {
                  wire.listPoints
                      .firstWhere(
                          (PointPosition point) => _pointDraggedId! == point.id)
                      .setPos(tapX, tapY);
                });
              },
              onPanEnd: (DragEndDetails details) {
                setState(() {
                  _pointDraggedId = null;
                });
              },
              child: Container(
                color: Colors.red,
                width: Wire.lenght(first, last) + 2.5,
                height: 5,
              ),
            ),
          ),
        );
        widgets.add(widget);
      }
    }
    return widgets;
  }

  Widget contactNameWidget() {
    /// The `contactNameWidget` is showing when hovering contact

    try {
      ContactData contact = _listDevices!
          .expand((list) => list.contacts)
          .firstWhere((item) => item.isHover);

      return ContactHidenPanel(
        x: contact.x,
        y: contact.y,
        text: contact.toString(),
      );
    } catch (e) {
      return const SizedBox();
    }
  }

  List<Positioned> positionedPointRender() {
    List<Positioned> widgets = [];

    for (Wire wire in _wireList!) {
      for (int i = 1; i < wire.listPoints.length - 1; i++) {
        final pos = wire.listPoints[i];

        var widget = Positioned(
          left: pos.x,
          top: pos.y,
          child: GestureDetector(
            onPanStart: (DragStartDetails details) {
              setState(() => _pointDraggedId = pos.id);
            },
            onPanUpdate: (DragUpdateDetails details) => setState(() {
              final globalPosition = details.globalPosition;
              final tapX = globalPosition.dx;
              final tapY = globalPosition.dy;

              wire.listPoints
                  .firstWhere((PointPosition p) => pos.id == p.id)
                  .setPos(tapX - ApplicationStyles.widthTaskDeviceRow, tapY);
            }),
            onPanEnd: (DragEndDetails details) => setState(() {
              _pointDraggedId = null;
            }),
            onTap: () {
              print("НАжали");
            },
            onDoubleTap: () => setState(() {
              wire.listPoints.removeWhere((PointPosition p) => pos.id == p.id);
            }),
            child: const Icon(
              Icons.circle,
              size: 10,
            ),
          ),
        );
        widgets.add(widget);
      }
    }

    return widgets;
  }

  List<Positioned> positionedDevicesList(context) {
    final List<DeviceData> droppedList = _listDevices!
        .where((DeviceData deviceData) => deviceData.isDropped)
        .toList();

    List<Positioned> widgets = [];

    for (DeviceData deviceData in droppedList) {
      widgets.add(
        Positioned(
          left: deviceData.x,
          top: deviceData.y,
          child: Draggable<DeviceData>(
            data: deviceData,
            feedback: deviceData.image,
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: deviceData.image,
            ),
            onDragEnd: (details) {
              deviceData.x =
                  details.offset.dx - ApplicationStyles.widthTaskDeviceRow;
              deviceData.y = details.offset.dy;

              deviceData.isDropped =
                  isBetween(0, deviceData.image.width!, deviceData.x) &&
                      isBetween(0, deviceData.image.height!, deviceData.y);
              mainDataProvider!.updateData();
              setState(() {});
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                deviceData.image,
                ...deviceData.contacts.map(
                  (ContactData c) {
                    return (c.mayUse)
                        ? Positioned(
                            left: c.offset.dx,
                            top: c.offset.dy,
                            child: GestureDetector(
                              onTap: () => onContactClick(c),
                              child: MouseRegion(
                                child: Icon(
                                  Icons.square,
                                  size: 12,
                                  color:
                                      (c.isHover || c == _selectedContactData)
                                          ? Colors.red
                                          : Colors.transparent,
                                ),
                                onEnter: (value) =>
                                    setState(() => c.isHover = true),
                                onExit: (value) =>
                                    setState(() => c.isHover = false),
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    if (_listDevices != null) {
      for (DeviceData device in _listDevices!) {
        for (ContactData contact in device.contacts) {
          contact.x = device.x + contact.offset.dx;
          contact.y = device.y + contact.offset.dy;
        }
      }
    }

    for (Wire wire in _wireList!) {
      wire.updatePoints();
    }

    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DragTarget<DeviceData>(
            builder: (context, candidateData, rejectedData) {
              return Stack(
                clipBehavior: Clip.none,
                children: positionedDevicesList(context),
              );
            },
          ),
          const Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              children: [
                CompleteButton(),
                SizedBox(height: 10),
                ResetButton(),
              ],
            ),
          ),
          contactNameWidget(),
          ...wiresWidgetList(),
          ...positionedPointRender(),
        ],
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      radius: 64,
      icon: Icons.replay,
      foregroundColor: ApplicationStyles.applicationColors.iconStrokeColor,
      backgroundColor: ApplicationStyles.applicationColors.resetColor,
      onTap: MainDataProvider.of(context).onReset,
    );
  }
}

class CompleteButton extends StatelessWidget {
  const CompleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      radius: 64,
      icon: Icons.check,
      foregroundColor: ApplicationStyles.applicationColors.iconStrokeColor,
      backgroundColor: ApplicationStyles.applicationColors.completeColor,
      onTap: MainDataProvider.of(context).onComplete,
    );
  }
}
