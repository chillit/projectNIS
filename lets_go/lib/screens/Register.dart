import 'package:flutter/material.dart';
import 'package:lets_go/shared_prefs.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isCheked = true;

  var userName = TextEditingController();
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
                const Text('Sign up',
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.only(top: 10)),
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
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: passWord2,
                  decoration: const InputDecoration(
                    label: Text('Repeat password'),
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
                        print('${userName.text} & ${passWord.text} / ${passWord2.text}');
                        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        SharedPrefs().isSigned = true;
                        SharedPrefs().username = userName.text;
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
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pinkAccent,
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