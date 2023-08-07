import 'package:flutter/material.dart';
import 'package:projects/models/models.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter email or Phone number',
              filled: _hidePass,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            obscureText: _hidePass,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: 'Password',
              counterText: 'Forgot password?',
              suffixIcon: IconButton(
                onPressed: () {
                  _hidePass = !_hidePass;
                  setState(() {});
                },
                icon: !_hidePass
                    ? const Icon(
                  Icons.visibility,
                )
                    : const Icon(
                  Icons.visibility_off,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Sign In"))),
              onPressed: () =>
                  Provider.of<AppStateManager>(context, listen: false)
                      .login('Username', 'Password'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}