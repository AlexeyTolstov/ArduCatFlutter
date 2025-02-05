import 'package:ArduinoSimulator/styles/app_styles.dart';
import 'package:ArduinoSimulator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class DeviceItemWidget extends StatelessWidget {
  final String title;
  final int n;
  final int maxN;
  final Image image;
  final Function() onTap;

  const DeviceItemWidget({
    super.key,
    required this.title,
    required this.image,
    required this.n,
    required this.maxN,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ApplicationStyles.applicationColors.borderItemColor,
          width: 1,
        ),
        color: (maxN == n) 
          ? ApplicationStyles.applicationColors.fullItemColor 
          : ((n == 0)
            ? ApplicationStyles.applicationColors.emptyItemColor
            : ApplicationStyles.applicationColors.halfEmptyColor),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            offset: const Offset(3, 4),
            color: ApplicationStyles.applicationColors.borderShadowColor,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: image,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title),
                Text(
                  (n >= 1 && maxN > 1)
                  ? "$n/$maxN"
                  : ""
                ),
              ],
            ),
            if (n != maxN)
              CustomIconButton(
                radius: 30,
                icon: Icons.replay,
                foregroundColor:
                    ApplicationStyles.applicationColors.iconStrokeColor,
                backgroundColor: ApplicationStyles.applicationColors.resetColor,
                onTap: onTap,
              )
            else
              const SizedBox(
                width: 30,
                height: 30,
              ),
          ],
        ),
      ),
    );
  }
}
