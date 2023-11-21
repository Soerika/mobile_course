import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ChangePasswordPage> createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            TextFormField(
              // Add properties for current password input
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Hide text for password input
              // Add validation logic if needed
            ),
            const SizedBox(height: 20),
            TextFormField(
              // Add properties for new password input
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              // Add validation logic if needed
            ),
            const SizedBox(height: 20),
            TextFormField(
              // Add properties for confirming new password input
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              // Add validation logic if needed
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to change password
              },
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
