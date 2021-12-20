import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_app/displayPage.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LogInPage();
  }
}

class _LogInPage extends State<LogInPage> {
  final validateKey = GlobalKey<FormState>();

  TextEditingController inputField1 = TextEditingController();
  TextEditingController inputField2 = TextEditingController();

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Material(
        child: Localizations(
          locale: const Locale('en', 'US'),
          delegates: <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: MediaQuery(
            data: const MediaQueryData(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: validateKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 200.0),
                    TextFormField(
                      key: Key('user'),
                      //focusNode: focusNode,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      controller: inputField1,
                      decoration: InputDecoration(
                          hintText: "enter user name",
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(width: 1.5, color: Colors.black))),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      key: Key('pass'),
                      focusNode: focusNode,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      controller: inputField2,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "enter password",
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(width: 1.5, color: Colors.black))),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        focusNode.unfocus();
                        var isValid = validateKey.currentState?.validate();
                        if (isValid!) {
                          String user = inputField1.text;
                          String pass = inputField2.text;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayPage(
                                userName: user,
                                passWord: pass,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    inputField1.dispose();
    inputField2.dispose();
  }
}
