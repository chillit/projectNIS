import 'package:flutter/material.dart';
import 'package:lets_go/constans.dart';
import 'package:lets_go/shared_prefs.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isCheked = true;
  bool isEmailCorrect = true;
  bool isPasswordCorrect = true;
  bool isPassword2Correct = true;

  var userName = TextEditingController();
  var eMail = TextEditingController();
  var passWord = TextEditingController();
  var passWord2 = TextEditingController();

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
                  controller: eMail,
                  onChanged: (text) {
                    if (!text.contains('@')) {
                      setState(() {
                        isEmailCorrect = false;
                      });
                    } else {
                      setState(() {
                        isEmailCorrect = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    filled: true,
                    border: InputBorder.none,
                    errorText: isEmailCorrect || eMail.text.isEmpty
                        ? null
                        : "Type correct email",
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: passWord,
                  onChanged: (text) {
                    if (text.length < 8) {
                      setState(() {
                        isPasswordCorrect = false;
                      });
                    } else {
                      setState(() {
                        isPasswordCorrect = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    filled: true,
                    border: InputBorder.none,
                    errorText: isPasswordCorrect || passWord.text.isEmpty
                        ? null
                        : "Type 8 or more symbol",
                  ),
                  obscuringCharacter: '*',
                  obscureText: isCheked,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: passWord2,
                  onChanged: (text) {
                    if (text.length < 8) {
                      setState(() {
                        isPassword2Correct = false;
                      });
                    } else {
                      setState(() {
                        isPassword2Correct = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('Repeat password'),
                    filled: true,
                    border: InputBorder.none,
                    errorText: isPassword2Correct || passWord2.text.isEmpty
                        ? null
                        : "Type 8 or more symbols",
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
                        print('${userName.text} & ${passWord.text} / ${passWord2.text}');
                        ScaffoldMessenger.of(context).clearSnackBars();
                        if (userName.text.isNotEmpty &&
                            eMail.text.isNotEmpty &&
                            isEmailCorrect &&
                            passWord.text.isNotEmpty &&
                            isPasswordCorrect &&
                            (passWord.text == passWord2.text)) {
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                          SharedPrefs().isSigned = true;
                          SharedPrefs().username = userName.text;
                          SharedPrefs().email = eMail.text;
                        } else if (userName.text.isEmpty ||
                            eMail.text.isEmpty ||
                            passWord.text.isEmpty ||
                            passWord2.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('There are some empty fields!'),
                              backgroundColor: Color(0xffff0000),
                            ),
                          );
                        } else if (passWord.text != passWord2.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Passwords don\'t match!'),
                              backgroundColor: Color(0xffff0000),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please, fulfill the requirements!'),
                              backgroundColor: Color(0xffff0000),
                            ),
                          );
                        }
                      },
                      child: const Text('Register'),
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    print('login');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  child: const Text(
                    'Login',
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
