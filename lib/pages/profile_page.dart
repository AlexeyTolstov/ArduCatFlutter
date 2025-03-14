import 'package:ArduinoSimulator/styles/images.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: AppImages.mainHero,
                    ),
                    SizedBox(width: 40),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Толстов Алексей',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  spacing: 30,
                  children: [
                    Text('Курсы'),
                    Text('Соревнования'),
                    Text('Задачи'),
                  ],
                ),
                SizedBox(height: 50),
                ProfileCources(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCources extends StatelessWidget {
  const ProfileCources({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          itemCource(
            title: 'Курс молодого ардуинщика',
            description: 'Оффициальный курс',
            onTap: () {
              Navigator.pushNamed(context, '/cource/official');
            },
          ),
        ],
      ),
    );
  }

  Widget itemCource({
    required String title,
    required String description,
    required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.red,
        width: 500,
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
