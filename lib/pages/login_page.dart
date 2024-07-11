import 'package:experimental_app/config/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
    var check = false;
    var formController = TextEditingController();
    late String userName;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 178, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 40, right: 40, top: 18, bottom: 50),
                  child: const Text(
                    'SamuelGaySamuelGaySamuelGaySamuelGaySamuelGay',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: _globalFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: formController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Llene el campo >:(';
                          }

                          if(value.length > 10) {
                            return 'Exceso de caracteres >:(';
                          }
                          return null;
                        },
                        // onSaved: (user) => userName = user!,
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                            label: Text('Username...'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 160, 159, 159)
                            ),
                            counterStyle: TextStyle(
                              fontSize: 13
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 14
                            ),
                            hintText: 'Ingrese su nombre...'),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Llene el campo >:(';
                          }

                          if(value.length > 15) {
                            return 'Exceso de caracteres >:(';
                          }
                          return null;
                        },
                        cursorColor: Colors.blue,
                        obscureText: true,
                        obscuringCharacter: '*',
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: const InputDecoration(
                            label: Text('Password...'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            filled:true,                                                    fillColor: Colors.white70,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 160, 159, 159)
                            ),
                            counterStyle: TextStyle(
                              fontSize: 13
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 14),
                            hintText: 'Ingrese su contrasena...'),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Checkbox(
                              side: const BorderSide(width: 1.0, color: Color.fromARGB(255, 196, 195, 195)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              value: check, 
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              }),
                          ),
                          const Expanded(
                            child: Text(
                              'Remember me',
                              style: TextStyle(
                                color: Color.fromARGB(255, 139, 139, 139),
                                fontSize: 11
                              ),
                            )
                          ),
                          const Text(
                            'Recovery password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 139, 139, 139),
                                fontSize: 11
                              ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color.fromARGB(255, 42, 89, 243),
                          elevation: 7,
                          shadowColor: const Color.fromARGB(255, 49, 169, 248),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                        ),
                        onPressed: () {
                          if(_globalFormKey.currentState!.validate()) {
                            // usando un controlador
                            userName = formController.text;
                            // _globalFormKey.currentState!.save();
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.home,
                              arguments: userName
                            );
                          }
                        }, 
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                          child: Text('Login', style: TextStyle(color: Colors.white),),
                        )),

                        const SizedBox(height: 20,),

                        // Desea continuar?
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 161, 161, 161),
                                thickness: 1.0,
                              ),
                            ),
                            Text('Or Continue', style: TextStyle(
                              color: Color.fromARGB(255, 170, 169, 169),
                              fontSize: 11
                            ),),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 161, 161, 161),
                                thickness: 1.0,
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonIconLogIn(
                              const  Color.fromARGB(255, 218, 219, 219), 
                              icon: 'assets/images/google.png',
                              textButton: 'Google', 
                              action: () {}
                            ),
                            const SizedBox(width: 30,),
                            ButtonIconLogIn(
                              const  Color.fromARGB(255, 218, 219, 219), 
                              icon: 'assets/images/facebook.png', 
                              textButton: 'Facebook', 
                              action: () {}
                            )
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class ButtonIconLogIn extends StatelessWidget {
  final String icon;
  final String textButton;
  final Color colorButton;
  final VoidCallback action;
  
  const ButtonIconLogIn(
    this.colorButton,
    {
    super.key,
    required this.icon,
    required this.textButton,
    required this.action
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 65,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        )
      ),
      onPressed: action, 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(icon),
            width: 20,
            height: 20,),
          const SizedBox(width: 10,),
          Text(textButton, style: const TextStyle(
            color: Colors.black,
            fontSize: 13
          ),)
        ],
      )
     )
    );
  }
}