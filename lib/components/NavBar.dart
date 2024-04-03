
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/instructions.dart';
import '../screens/login_page.dart';
import '../screens/welcome_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Вход'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: InkWell(
              onTap: () {
                // Navigate to the website
                launch('https://adilet.zan.kz/rus/docs/K080000095_');
              },
              child: Text(
                'Бюджетный кодекс Республики Казахстан',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_2),
            title: Text('Правила составления и представления бюджетной заявки'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Поделиться'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Уведомление'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.integration_instructions),
            title: Text('Инструкция'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InstructionPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Документы'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Выход'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
