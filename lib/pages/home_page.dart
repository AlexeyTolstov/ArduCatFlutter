import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ArduinoSimulator/styles/images.dart';
import 'package:ArduinoSimulator/widgets/cards_item_usage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _banerWidget(),
            _usageSystemWidget(),
            _contacts(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(child: SizedBox()),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text('Войти'),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text('Зарегистрироваться'),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }

  Row _banerWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 500,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20.0, height: 140),
                    const Text(
                      'ArduCat',
                      style: TextStyle(fontSize: 43.0),
                    ),
                    const SizedBox(width: 20.0, height: 200.0),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Horizon',
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText('Твори'),
                          RotateAnimatedText('Учись'),
                          RotateAnimatedText('Создавай'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'ArduCat - лучшая система проверки сборки схемы\n и написания код на Arduino',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          clipBehavior: Clip.hardEdge,
          width: 400,
          height: 400,
          child: AppImages.mainHero,
        ),
      ],
    );
  }

  Padding _usageSystemWidget() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Сферы применения',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 30),
          Row(
            spacing: 60,
            children: [
              CardsItemUsage(
                title: 'Проведение олимпиад и хакатонов',
                description:
                    'Вы можете свободно пользоваться нашей платформой для проведения олимпиад, но лучше заранее уведомить администрацию.',
                widget: AppImages.cup,
              ),
              CardsItemUsage(
                title: 'Обучение Arduino и совершенствование своих навыков',
                description:
                    'ArduCat поможет вам проверять и развивать свои навыки и знания.',
                widget: AppImages.progress,
              ),
              CardsItemUsage(
                title: 'Создание курсов',
                description:
                    'Вы также можете использовать ArduCat для проведения курсов: создавать их самостоятельно, управлять учениками, отслеживать статистику и многое другое.',
                widget: AppImages.utils,
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _contacts() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Остались вопросы?'),
          Text('Напишите в telegram: @TolstovAlexey')
        ],
      ),
    );
  }
}
