import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: (){
                              setState(() {
                                selectedTabIndex=loginTab;
                              });
                            },
                            child: Text(
                              "LOGIN",
                              style: tabTextStyle.apply(
                                color: selectedTabIndex==loginTab?Colors.white
                                :Colors.white54
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              "SIGN UP",
                              style: tabTextStyle.apply(
                                color: selectedTabIndex==signUpTab?Colors.white
                                :Colors.white54
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child: selectedTabIndex==loginTab
                           ?_Login(themeData: themeData)
                          :_SignUp(themeData: themeData),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: themeData.textTheme.titleMedium!.apply(color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "sign in with your account",
          style: themeData.textTheme.titleSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(label: Text("Username")),
        ),
        PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(themeData.colorScheme.primary),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: Text("LOGIN")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot your password?"),
            SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: Text("Reset here"))
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          "OR SIGN IN WITH",
          style: TextStyle(letterSpacing: 2),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 35),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 35),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 35)
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to blog club",
          style: themeData.textTheme.titleMedium!.apply(color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "please enter your information",
          style: themeData.textTheme.titleSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(label: Text("Fullname")),
        ),
        TextField(
          decoration: InputDecoration(label: Text("Username")),
        ),
        PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(themeData.colorScheme.primary),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: Text("SIGNUP")),
        SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          "OR SIGN UP WITH",
          style: TextStyle(letterSpacing: 2),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 35),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 35),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 35)
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: Text("Password"),
          suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(
                obscureText ? "Show" : "Hide",
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.primary),
              ))),
    );
  }
}
