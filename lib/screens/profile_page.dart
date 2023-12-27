import "package:healthcare_app/main.dart";
import "package:healthcare_app/screens/changepass_page.dart";
import "package:healthcare_app/screens/medicalrecord_page.dart";
import 'package:healthcare_app/utils/config.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../models/auth_model.dart";
import "../providers/dio_provider.dart";

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> user = {};
  
  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthModel>(context, listen: false).getUser;
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            color: Config.primaryColor,
            // ignore: prefer_const_constructors
            child: Column(
              children:  <Widget>[
                const SizedBox(
                  height: 110,
                ),
                CircleAvatar(
                  radius: 65.0,
                  backgroundImage: NetworkImage(user['profile_photo_url']),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '20 Years Old | Female',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey[200],
            child: Center(
              child: Card(
                margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: Container(
                  width: 300,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.blueAccent[400],
                              size: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordPage()),
                                );
                              },
                              child: const Text(
                                "Settings",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.history,
                              color: Colors.blueAccent[400],
                              size: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MedicalRecordScreen()),
                                );
                              },
                              child: const Text(
                                "History",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.blueAccent[400],
                              size: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () async {
                                final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                final token = prefs.getString('token') ?? '';

                                if (token.isNotEmpty && token != '') {
                                  final response =
                                  await DioProvider().logout(token);

                                  if (response == 200) {
                                    await prefs.remove('token');
                                    setState(() {
                                      Provider.of<AuthModel>(context, listen: false).setFavList([]);
                                      MyApp.navigatorKey.currentState!
                                          .pushReplacementNamed('/');
                                    });
                                  }
                                }
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
