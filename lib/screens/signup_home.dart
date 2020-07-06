import 'package:FlutterStyle/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class SignUpHomeScreen extends StatefulWidget {
  @override
  SignUpHomeScreenState createState() {
    return SignUpHomeScreenState();
  }
}

class SignUpHomeScreenState extends State<SignUpHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hasAccepted = false;
  String _email;
  String _password;
  String _firstName;
  String _lastName;
  ProgressDialog pr;

  final checkEmailFormat = RegExp('[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+');

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

    return Builder(
      builder: (subContext) => Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'First Name',
                        ),
                        onSaved: (String value) {
                          _firstName = value;
                        },
                        validator: (String value) {
                          int lenght = value.length;
                          print(lenght);
                          return (lenght < 3)
                              ? 'Please use at least 3 characters'
                              : null;
                        }),
                    TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Last Name',
                        ),
                        onSaved: (String value) {
                          _lastName = value;
                        },
                        validator: (String value) {
                          int lenght = value.length;
                          print(lenght);
                          return (lenght < 3)
                              ? 'Please use at least 3 characters'
                              : null;
                        }),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        labelText: 'Email',
                      ),
                      onSaved: ((String value) {
                        _email = value;
                      }),
                      validator: (String value) {
                        bool matches = checkEmailFormat.hasMatch(value);
                        print(matches);
                        return matches
                            ? null
                            : 'Please use a valid email address';
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                        onSaved: (String value) {
                          _password = value;
                        },
                        validator: (String value) {
                          int lenght = value.length;
                          print(lenght);
                          return (lenght < 8)
                              ? 'Please use at least 8 characters'
                              : null;
                        }),
                    CheckboxListTile(
                      value: _hasAccepted,
                      title: Text('Accept terms'),
                      onChanged: (value) =>
                          setState(() => _hasAccepted = value),
                    ),
                    RaisedButton(
                      child: Text('Sign-up'),
                      onPressed: () async {
                        final form = _formKey.currentState;

                        if (form.validate()) {
                          if (_hasAccepted == false) {
                            print('error accept terms');
                            Scaffold.of(subContext).showSnackBar(SnackBar(
                              content: Text('Please Accept terms'),
                            ));
                            return;
                          }
                          form.save();
                          print(
                              'submitted values firstName: $_firstName lastName: $_lastName email: $_email password: $_password acceptTerms: $_hasAccepted ');

                          UsersProvider provider = Provider.of<UsersProvider>(
                              context,
                              listen: false);
                          await provider.register(
                              _firstName, _lastName, _email, _password);

                          if (provider.currentUser != null) {
                            pr.show();
                            Navigator.of(context)
                                .popAndPushNamed('/team-selection');
                            print(
                                'currentUser firstName: ${provider.currentUser.fisrtName}');
                            await Future.delayed(Duration(seconds: 1));
                            pr.hide();
                          } else {
                            Scaffold.of(subContext).showSnackBar(SnackBar(
                              content: Text('Invalid Credentials'),
                            ));
                          }
                        } else {
                          Scaffold.of(subContext).showSnackBar(SnackBar(
                            content: Text('Please fill the form'),
                          ));
                        }
                      },
                    )
                  ],
                ),
              ]),
            ),
          )),
    );
  }
}
