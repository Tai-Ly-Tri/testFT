import 'package:flutter/material.dart';
import 'package:test_ft/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "nhap Email", labelText: "Email"),
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ban chua nhap email";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "nhap Password", labelText: "Password"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ban chua nhap mat khau";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, MyRoutes.homeRoutes);
                            } // bat loi dang nhap
                          },
                          child: Text("Login"),
                          style: TextButton.styleFrom(
                              minimumSize: Size(150, 50),
                              backgroundColor: context.theme.buttonColor),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
