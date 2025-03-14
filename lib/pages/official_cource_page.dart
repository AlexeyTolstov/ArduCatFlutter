import 'package:flutter/material.dart';

class OfficialCourcePage extends StatefulWidget {
  const OfficialCourcePage({super.key});

  @override
  State<OfficialCourcePage> createState() => _OfficialCourcePageState();
}

class _OfficialCourcePageState extends State<OfficialCourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 400),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              headerTitle(),
              SizedBox(height: 30),
              listOfLessons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Курс молодого ардуинщика',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'Это оффициальный курс, разработанный специально для быстрого погружение в программирование на Arduino',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Text(
          'Разработчки:',
          style: TextStyle(fontSize: 15),
        ),
        Text(
          'Толстов Алексей',
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }

  Widget listOfLessons() {
    return Column(
      spacing: 10,
      children: [
        ItemLesson(
          title: 'Общая информация и правила курса',
          n: 2,
        ),
        ItemLesson(
          title: 'Сборка схемы',
          n: 1,
          onTap: () {
            Navigator.pushNamed(context, '/cource/official/task');
          },
        ),
      ],
    );
  }
}

class ItemLesson extends StatefulWidget {
  final String title;
  final int n;
  final GestureTapCallback? onTap;

  const ItemLesson({
    Key? key,
    required this.title,
    required this.n,
    this.onTap,
  }) : super(key: key);

  @override
  _ItemLessonState createState() => _ItemLessonState();
}

class _ItemLessonState extends State<ItemLesson> {
  Color bg = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          bg = Colors.yellow;
        });
      },
      onExit: (event) {
        setState(() {
          bg = Colors.red;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 500,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 3,
              color: bg,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.circle,
                color: Colors.green,
                size: 64,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(widget.title),
                  Text('${widget.n}/${widget.n} уроков'),
                ],
              ),
              Spacer(),
              //arrow_downward
              Icon(Icons.arrow_upward),
            ],
          ),
        ),
      ),
    );
  }
}
