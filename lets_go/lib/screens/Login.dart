import 'package:flutter/material.dart';
import 'package:lets_go/constans.dart';
import '../shared_prefs.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isCheked = true;

  var userName = TextEditingController();
  var passWord = TextEditingController();

  /*тут некоторые строки связаны с файербейс. Я их пока что закоментирую,
  потому что это не особо правильно и файербейс пока что не подключен к проекту*/

  //CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Name of application',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: userName,
                  decoration: const InputDecoration(
                      label: Text('Username'),
                      filled: true,
                      border: InputBorder.none),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: passWord,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    filled: true,
                    border: InputBorder.none,
                  ),
                  obscuringCharacter: '*',
                  obscureText: isCheked,
                ),
                Row(children: [
                  Checkbox(
                    value: isCheked,
                    onChanged: (value) {
                      setState(() {
                        isCheked = !isCheked;
                      });
                    },
                  ),
                  const Text('Hide password'),
                ]),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('${userName.text} & ${passWord.text}');
                        ScaffoldMessenger.of(context).clearSnackBars();
                        if (userName.text.isNotEmpty &&
                            passWord.text.isNotEmpty) {
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                          SharedPrefs().isSigned = true;
                          SharedPrefs().username = userName.text;
                          SharedPrefs().email = "Потом исправим, когда подключим к базе данных";
                        } else if (userName.text.isEmpty || passWord.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('There are some empty fields!'),
                              backgroundColor: Color(0xffff0000),
                            ),
                          );
                        }
                      },
                      child: const Text('Login'),
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    print('register');
                    Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 17,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}