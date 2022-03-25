import 'package:localization_app/language/language_service.dart';
import 'package:localization_app/language/localization.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .13,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * .5,
                      width: MediaQuery.of(context).size.width * .5,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ToggleSwitch(
                      borderColor: [Colors.black],
                      borderWidth: 1,
                      minWidth: 100,
                      minHeight: 40,
                      cornerRadius: 3.0,
                      initialLabelIndex:
                          appLanguage.appLocal == Locale('en') ? 0 : 1,
                      activeBgColor: [Colors.blue],
                      activeFgColor: Colors.white,
                      // activeBgColor: Colors.blue,
                      inactiveBgColor: Colors.white,
                      changeOnTap: true,
                      labels: ['English', 'عر'],
                      onToggle: (index) async {
                        if (index == 0) {
                          print("en");
                          appLanguage.changeLanguage(Locale('en'));
                        }
                        if (index == 1) {
                          print("ar");
                          appLanguage.changeLanguage(Locale('ar'));
                        }
                      },
                      totalSwitches: 2,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * .7,
                      child: TextFormField(
                        onChanged: (value) {
                          print(value);
                        },

                        obscureText: hidePassword, //show/hide password
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translate('password'),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: hidePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                30), //circular border for TextField.
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.blueGrey[900],
                child: Column(
                  children: [
                    Container(
                      //height: 50,
                      width: MediaQuery.of(context).size.width * .7,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => TabPage(),
                          //   ),
                          // );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffff5f6d),
                                Color(0xffff5f6d),
                                Color(0xffffc371),
                              ],
                            ),
                          ),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .7,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('loginText'),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(6),
                        // ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context).translate('needHelp'),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
