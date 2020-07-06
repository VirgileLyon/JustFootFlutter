import 'package:FlutterStyle/models/user_model.dart';
import 'package:FlutterStyle/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProgressDialog pr;

  UserModel user;

  @override
  void initState() {
    UsersProvider provider = Provider.of<UsersProvider>(context, listen: false);
    user = provider.currentUser;

    super.initState();
  }

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

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/pp.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.description,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                      onPressed: () {},
                      child: const Text('Edit profil',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(
                'My success',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green[300],
                ),
              ),
            ),
            SizedBox(height: 30),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BadgeWidget(
                          'assets/badgesuccess.png',
                          'Give a zero',
                        ),
                        BadgeWidget(
                          'assets/badgenotsuccess.png',
                          'Give a zero',
                        ),
                        BadgeWidget(
                          'assets/badgenotsuccess.png',
                          'Give a zero',
                        ),
                        BadgeWidget(
                          'assets/badgesuccess.png',
                          'Give a zero',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BadgeWidget(
                            'assets/badgenotsuccess.png',
                            'Give a zero',
                          ),
                          BadgeWidget(
                            'assets/badgesuccess.png',
                            'Give a zero',
                          ),
                          BadgeWidget(
                            'assets/badgesuccess.png',
                            'Give a zero',
                          ),
                          BadgeWidget(
                            'assets/badgenotsuccess.png',
                            'Give a zero',
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.red,
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                UsersProvider provider =
                    Provider.of<UsersProvider>(context, listen: false);
                provider.logout();
                if (provider.currentUser == null) {
                  pr.show();
                  await Future.delayed(Duration(seconds: 1));
                  pr.hide();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  String imageAsset;
  String badgeText;

  BadgeWidget(this.imageAsset, this.badgeText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageAsset,
          height: 70,
          width: 70,
        ),
        Container(
          child: Text(
            badgeText,
            textAlign: TextAlign.center,
          ),
          width: 70,
          height: 30,
        ),
      ],
    );
  }
}
