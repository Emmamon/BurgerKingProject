import 'package:burgerking/helpers/TriglePainter.dart';
import 'package:burgerking/utils/Api.dart';
import 'package:burgerking/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();
  var _phoneController = TextEditingController();
  var _phoneError = "";
  var _passwordController = TextEditingController();
  var _passwordError = "";
  var _errorsMsg = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TriglePainter(size),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      child: Image.asset("assets/images/FoodMonkey.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 35, color: normal),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            onChanged: (value) {
                              if (value.length < 7 || value.length > 11) {
                                setState(() {
                                  _phoneError =
                                      "Phone number must has between 7 to 11 digits";
                                });
                              } else {
                                setState(() {
                                  _phoneError = "";
                                });
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (value.isEmpty) {
                                _errorsMsg.add("Phone number can't be Empty");
                                return "Phone number can't be Empty!";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Phone",
                                errorText: _phoneError,
                                prefixIcon: Icon(Icons.phone),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                _passwordError = "Password can't be empty";
                                return _passwordError;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.length < 8) {
                                setState(() {
                                  _passwordError =
                                      "Password must have at least 8 chars";
                                });
                              } else {
                                setState(() {
                                  _passwordError = "";
                                });
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Password",
                                errorText: _passwordError,
                                prefixIcon: Icon(Icons.lock),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: 150,
                                child: RaisedButton(
                                  color: secondary,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  onPressed: () {
                                    var con = _formKey.currentState.validate();
                                    if (con) {
                                      var phone = _phoneController.text;
                                      var password = _passwordController.text;

                                      Api.userLogin(phone, password);
                                    } else {
                                      print(_errorsMsg);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 30,
                                        color: primary,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 20, color: primary),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
