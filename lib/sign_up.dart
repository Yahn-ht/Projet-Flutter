import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/connexion_screen.dart';
import 'package:test_app/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  late SharedPreferences prefs;
  String? email;
  String? firstName;
  String? password;

  bool isObscur = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    firstName = prefs.getString('firstName');
    password = prefs.getString('password');
  }

  @override
  void dispose() {
    _email.dispose;
    _password.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screen.height,
              width: screen.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/home.jpg'),
                ),
              ),
            ),
            Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.black.withOpacity(0.8)),
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Welcome\nBack",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 58, 56, 56),
                                  radius: 40,
                                  child: Icon(Icons.handshake),
                                )
                              ],
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  child: TextFormField(
                                    controller: _email,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value != email) {
                                        return 'Invalidate';
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.4)),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  child: TextFormField(
                                    obscureText: isObscur,
                                    controller: _password,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value != password) {
                                        return 'Invalidate';
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(isObscur
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          isObscur = !isObscur;
                                          setState(() {});
                                        },
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.4)),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  margin: const EdgeInsets.only(bottom: 40.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screen.height * 0.07,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 94, 97, 236),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return const Home();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Sign in',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                                      return const ConnexionScreen();
                                    }));
                                  },
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
