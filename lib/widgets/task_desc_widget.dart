import 'package:ArduinoSimulator/styles/app_styles.dart';
import 'package:ArduinoSimulator/styles/markdown_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

String myData = '''
# Задание 1. Первая схема
Соберите простую схему, используя плату Arduino UNO, в которой светодиод подключен к **цифровому контакту 13**.


> Для этого подключите плюс светодиода к **контакту 13**, а минус — к **GND**.

''';

class TaskDescWidget extends StatelessWidget {
  const TaskDescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: ApplicationStyles.heightTaskWidget,
        color: ApplicationStyles.applicationColors.textBackgroundColor,
        child: Markdown(
          data: myData,
          styleSheet: markdownStyleSheet,
          builders: {
            'code': CodeElementBuilder(),
          },
        ),
      ),
    );
  }
}

