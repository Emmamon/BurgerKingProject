import 'package:burgerking/helpers/TriglePainter.dart';
import 'package:burgerking/utils/Api.dart';
import 'package:burgerking/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  var _nameError = "";
  var _emailController = TextEditingController();
  var _emailError = "";
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
                      "Register",
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
                            controller: _nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                _errorsMsg.add("Name can't be empty");
                                return "Name can't be empty";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.length < 6) {
                                setState(() {
                                  _nameError =
                                      "Name must have at least 6 chars";
                                });
                              } else {
                                setState(() {
                                  _nameError = "";
                                });
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z]'))
                            ],
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "Username",
                                errorText: _nameError,
                                errorBorder: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                _errorsMsg.add("Email can't be empty");
                                return "Email can't be empty";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.length < 15) {
                                setState(() {
                                  _emailError =
                                      "Email must have at least 15 chars";
                                });
                              } else {
                                setState(() {
                                  _emailError = "";
                                });
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                labelText: "Email",
                                errorText: _emailError,
                                errorBorder: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
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
                                return "Phone number can't be Empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "Phone",
                                errorText: _phoneError,
                                errorBorder: OutlineInputBorder(),
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
                                _errorsMsg.add("Password can't be empty");
                                return "Password can't be empty";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.length < 8) {
                                setState(() {
                                  _passwordError =
                                      "Password must be at least 8 chars";
                                });
                              } else {
                                setState(() {
                                  _passwordError = "";
                                });
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z]'))
                            ],
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password",
                                errorText: _passwordError,
                                 errorBorder: OutlineInputBorder(),
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
                                      var name = _nameController.text;
                                      var email = _emailController.text;
                                      var phone = _phoneController.text;
                                      var password = _passwordController.text;

                                      Api.userRegister(
                                          name, email, phone, password);
                                    } else {
                                      print(_errorsMsg);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.person, size: 30, color: primary,),
                                      Text("Register", style: TextStyle(fontSize: 20, color: primary),)
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
