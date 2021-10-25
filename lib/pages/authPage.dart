
import 'package:flutter/material.dart';
import 'package:flutter_login/provider/pageNotifier.dart';
import 'package:provider/provider.dart';

class AuthPage extends Page {
  static final pageName = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => AuthWidget());
  }
} //AuthWidget 으로 가는 Route

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool isRegister = false;

  Duration _duration = Duration(milliseconds: 300);
  Curve _curve = Curves.fastOutSlowIn;

  static double _cornerRadius = 8.0;

  OutlineInputBorder _border = OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_cornerRadius),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0
                        ),
                      );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login_2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                reverse: true,
                padding: EdgeInsets.all(6),
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 36,
                    child: Image.asset('images/icon_chat.png'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isRegister = false;
                          });
                        },
                        child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: isRegister ? FontWeight.w400 : FontWeight.w600,
                            ),
                        ),
                        style: TextButton.styleFrom(
                          primary: isRegister ? Colors.black45 : Colors.black87
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isRegister = true; 
                          });
                        },
                        child: Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: isRegister ? FontWeight.w600 : FontWeight.w400,
                            ),
                        ),
                        style: TextButton.styleFrom(
                          primary: isRegister ? Colors.black87 : Colors.black45
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  _buildTextFormField('Email Address', _emailController),
                  SizedBox(
                    height: 8,
                  ),
                  _buildTextFormField('Password', _passwordController),
                  AnimatedContainer(
                  duration: _duration,
                   height: isRegister ? 8 : 0,
                   curve: _curve,
                  ),
                  AnimatedContainer(
                    height: isRegister ? 60 : 0,
                    duration: _duration,
                    curve: _curve,
                    child: _buildTextFormField('Confirm Password', _confirmPasswordController)
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      if(_formKey.currentState?.validate() == true){
                        print('모든 입력값이 올바르다!');
                        Provider.of<PageNotifier>(context,listen: false).goToMain();
                      }
                    },
                    child: Text(isRegister ? 'Register': 'Login'), style: TextButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_cornerRadius)
                    ),
                    padding: EdgeInsets.all(22),
                    backgroundColor: Colors.white54,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white54,
                    height: 31,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton('images/google_icon.png',() {
                        Provider.of<PageNotifier>(context,listen: false).goToMain();
                      }),
                      _buildSocialButton('images/facebook.png',() {
                        Provider.of<PageNotifier>(context,listen: false).goToMain();
                      }),
                      _buildSocialButton('images/apple_icon.png',() {
                        Provider.of<PageNotifier>(context,listen: false).goToMain();
                      }),
                    ],
                  ),
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

Container _buildTextButton(String text, Function() onPressed, FontWeight weight) {
    return Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      height: 50,
                      child: TextButton(
                        onPressed: onPressed,
                        child: Text(
                            text,
                            style: TextStyle(
                              fontWeight: weight,
                            ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.black87
                        ),
                      )
                    );
  }

  Container _buildSocialButton(String imagePath, Function() onPressed) {
    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white54
                      ),
                      child: IconButton(onPressed: onPressed, 
                        icon: ImageIcon(
                          AssetImage(imagePath),
                        ),
                      ),
                    );
  }

  TextFormField _buildTextFormField(String labelText,TextEditingController controller) {
    return TextFormField(
            controller: controller,
            validator: (text){
              if(controller != _confirmPasswordController && (text == null || text.isEmpty)){
                return '입력해주세요!';
              }
              if(controller == _confirmPasswordController && isRegister && (text == null || text.isEmpty)){
                return '입력해주세요!';
              }
              return null;
            },
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: labelText,
              filled: true,
              fillColor: Colors.black45,
              border: _border,
              errorBorder: _border.copyWith(
                borderSide: BorderSide(
                  color: Colors.black,width: 3
                ),
              ),
              enabledBorder: _border,
              focusedBorder: _border,
              focusedErrorBorder: _border,
              errorStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold,
              ),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          );
  }
}

