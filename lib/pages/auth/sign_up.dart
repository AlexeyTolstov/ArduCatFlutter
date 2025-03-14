import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            width: 500,
            height: 300,
            child: Column(
              children: [
                Text('Зарегистрироваться'),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Логин',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Пароль',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Text('Зарегистрироваться'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  child: Text('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
