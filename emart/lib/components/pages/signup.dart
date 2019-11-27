import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emart/db/users.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  UserServices _userServices = UserServices();

  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();
  TextEditingController _confirmPasswordTextController =
      new TextEditingController();
  TextEditingController _nameTextController = new TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String gender;
  String groupValue = "Male";

  bool loading = false;
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
            children: <Widget>[
              Image.asset(
                'images/loginpageimage.jpg',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
                width: double.infinity,
                height: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 350.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      icon: Icon(Icons.person),
                                      border: InputBorder.none),
                                  keyboardType: TextInputType.text,
                                  controller: _nameTextController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The name can't be empty!";
                                    } else
                                      return null;
                                  }),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: new Container(
                            color: Colors.white.withOpacity(0.4),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                  title: Text("Male",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white)),
                                  trailing: Radio(
                                      value: "Male",
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                )),
                                Expanded(
                                  child: ListTile(
                                    title: Text("Female",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white)),
                                    trailing: Radio(
                                        value: "Female",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.email),
                                    border: InputBorder.none),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.lock),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _passwordTextController,
                                    obscureText: hidePass,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The password can't be empty!";
                                      } else if (value.length < 6) {
                                        return "The password has to be atleast 6 characters long!";
                                      } else
                                        return null;
                                    }),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(0.8),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: "Confirm password",
                                          icon: Icon(Icons.lock),
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _confirmPasswordTextController,
                                      obscureText: hidePass,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The password can't be empty!";
                                        } else if (value.length < 6) {
                                          return "The password has to be atleast 6 characters long!";
                                        } else if (_passwordTextController.text !=
                                            value) {
                                          return "Passwords don't match!";
                                        } else
                                          return null;
                                      }),
                                  trailing: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          hidePass = false;
                                        });
                                      }),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue.withOpacity(0.8),
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  validateForm();
                                },
                                child: Text(
                                  "Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                minWidth: MediaQuery.of(context).size.width,
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Expanded(child: Container()),
                        Divider(
                          color: Colors.white,
                        ),
                        Text("Other sign in options",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.withOpacity(0.8),
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                minWidth: MediaQuery.of(context).size.width,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: loading ?? true,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.9),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    ),
                  ),
                ),
              )
            ],
          ),
      ),

    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "Male") {
        groupValue = e;
        gender = e;
      } else if (e == "Female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();

      FirebaseUser user = await firebaseAuth.currentUser();

      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((user) => {
                  _userServices.createUser({
                    "username": _nameTextController.text,
                    "email": _emailTextController.text,
                    "userid": user.uid,
                    "gender": gender,
                  })
                })
            .catchError((err) => print(err.toString()));

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}
