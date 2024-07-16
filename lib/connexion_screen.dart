import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/sign_up.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({super.key});

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isObscur = false;

  late SharedPreferences prefs;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _saveValue() async {
    await prefs.setString('email', _email.text);
    await prefs.setString('firstName', _firstName.text);
    await prefs.setString('password', _password.text);
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
                                  "New\nAccount",
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
                                          value.trim().isEmpty) {
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
                                    controller: _firstName,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Invalidate';
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'first Name',
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
                                          value.trim().isEmpty) {
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
                                        _saveValue();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return const SignUp();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Get Started',
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
                                  "Already have an account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                                      return const SignUp();
                                    }));
                                  },
                                  child: const Text(
                                    'Sign in',
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
