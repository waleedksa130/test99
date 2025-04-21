import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_exam/applocal/applocal.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController showController = TextEditingController();

  String showText = "";

  @override
  void initState() {
    super.initState();
    showController.addListener(() {
      setState(() {
        showText = showController.text;
      });
    });
  }

  void clearAndExit() {
    usernameController.clear();
    passwordController.clear();
    showController.clear();
    SystemNavigator.pop(); // يخرج من التطبيق
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(getLang(context, 'homepage')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildInputField(
              controller: usernameController,
              hint: getLang(context, 'username'),
            ),
            _buildInputField(
              controller: passwordController,
              hint: getLang(context, 'password'),
              obscureText: true,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: clearAndExit,
                    icon: const Icon(Icons.clear, color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      usernameController.clear();
                      passwordController.clear();
                      showController.clear();
                    },
                    child: Text(getLang(context, 'clear')),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                    ),
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      showController.text =
                      ' $username\n $password';
                    },
                    child: Text(
                      getLang(context, 'login'),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            _buildInputField(
              controller: showController,
              hint: getLang(context, 'show'),
              maxLines: 3,
              readOnly: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),



            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    int maxLines = 1,
    bool readOnly = false,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
