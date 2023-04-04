import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_go/constans.dart';
import '../shared_prefs.dart';
import 'package:lets_go/Auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required Function this.changeReg}) : super(key: key);

  final Function changeReg;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isCheked = true;

  var eMail = TextEditingController();
  var passWord = TextEditingController();

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
                  controller: eMail,
                  decoration: InputDecoration(
                    label: Text('Username'),
                    floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: passWord,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
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
                      onPressed: () async {
                        print('${eMail.text} & ${passWord.text}');
                        ScaffoldMessenger.of(context).clearSnackBars();
                        if (eMail.text.isNotEmpty && passWord.text.isNotEmpty) {
                          // Navigator.pushNamedAndRemoveUntil(
                          //     context, '/', (route) => false);
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: eMail.text.trim(),
                              password: passWord.text.trim(),
                            );
                            Navigator.of(context,rootNavigator: true).pop();
                          } on FirebaseAuthException catch (e) {
                            Navigator.of(context,rootNavigator: true).pop();
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Oops!"),
                                      content: Text(e.message.toString()),
                                      backgroundColor: kSecondaryColor,
                                    ));
                          }
                          //SharedPrefs().isSigned = true;
                          SharedPrefs().username =
                              "Потом исправим, когда подключим к базе данных";
                          SharedPrefs().email = eMail.text;
                        } else if (eMail.text.isEmpty ||
                            passWord.text.isEmpty) {
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
                    widget.changeReg();
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

  @override
  void dispose() {
    // TODO: implement dispose
    eMail.dispose();
    passWord.dispose();
    super.dispose();
  }

/*Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: eMail.text.trim(),
      password: passWord.text.trim(),
    );
  }*/
}
