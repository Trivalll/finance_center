import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

import '../components/NavBar.dart';
import 'home_page_information/page1.dart';
import 'home_page_information/page2.dart';
import 'home_page_information/page3.dart';
import 'home_page_information/page4.dart';
import 'home_page_information/page5.dart';
import 'home_page_information/page6.dart';
import 'home_page_information/page7.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  final _formKey = GlobalKey<FormState>();
  bool _isFormVisible = false;

  // Mailgun configuration
  final String mailgunApiKey = '408f32f3-95ae2889'; // Replace with your Mailgun API key
  final String mailgunDomain = 'sandbox2d211a1b70cf4df0a24c55acbee07638.mailgun.org'; // Replace with your Mailgun domain
  final String mailgunSender = 'trivalllinfo@gmail.com'; // Replace with your sender email
  final String mailRecipient = 'recipient@example.com'; // Replace with the recipient's email address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Color.fromARGB(255, 74, 137, 195),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Image.asset(
                  "images/ePlanng.png",
                  width: 100,
                  height: 30,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 74, 137, 195),
              borderRadius: BorderRadius.only(),
            ),
            child: Text(
              "ИНФОРМАЦИОННАЯ СИСТЕМА «ГОСУДАРСТВЕННОЕ ПЛАНИРОВАНИЕ» БЮДЖЕТНОЕ ПЛАНИРОВАНИЕ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 350,
                  child: PageView(
                    controller: _controller,
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                      Page4(),
                      Page5(),
                      Page6(),
                      Page7(),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 7,
                  effect: JumpingDotEffect(
                    activeDotColor: Color.fromARGB(255, 74, 137, 195),
                    dotColor: Colors.deepPurple.shade100,
                    dotHeight: 10,
                    dotWidth: 27,
                    spacing: 12,
                    jumpScale: 2,
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isFormVisible = true;
                    });
                  },
                  child: Text('Отправить обратную связь'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20), // Increase the vertical spacing
                if (_isFormVisible) _buildFeedbackForm(context),
              ],
            ),
          ),

          // Contacts Section

          Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 74, 137, 195),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Свяжитесь с нами',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'График работы: ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'С 9:00 до 18:30 (с перерывом на обед с 13:00 до 14:30)',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 5),
                ClickableText(
                  'Телефон: +7 (7172) 73-54-44', () {
                    print('Phone clicked');
                  },
                ),
                SizedBox(height: 5),
                Text('Email: info@yourcompany.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: NavBar(),
      ),
    );
  }

  Widget _buildFeedbackForm(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: _isFormVisible ? 500 : 0,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Форма обратной связи',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ФИО',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ФИО';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ИИН',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ИИН';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите номер телефона';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите E-mail';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Модуль',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите модуль';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Сообщение',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите сообщение';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _sendEmail();
                    }
                  },
                  child: Text('Отправить'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendEmail() async {
    final mailgunUri = Uri.parse('https://api.mailgun.net/v3/$mailgunDomain/messages');

    final response = await http.post(
      mailgunUri,
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('api:$mailgunApiKey'))}',
      },
      body: {
        'from': 'Your App <$mailgunSender>',
        'to': mailRecipient,
        'subject': 'Feedback from your app', // Replace with your email subject
        'text': 'Feedback: ${_getFormData()}', // Include form data in the email body
      },
    );

    if (response.statusCode == 200) {
      print('Email sent successfully');
    } else {
      print('Failed to send email. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  String _getFormData() {
    // You can customize this method to include more form data
    return 'Name: ${_nameController.text}\n'
        'IIN: ${_iinController.text}\n'
        'Phone: ${_phoneController.text}\n'
        'Email: ${_emailController.text}\n'
        'Module: ${_moduleController.text}\n'
        'Message: ${_messageController.text}';
  }
}

// Add TextEditingController for each form field
final TextEditingController _nameController = TextEditingController();
final TextEditingController _iinController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _moduleController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  ClickableText(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
