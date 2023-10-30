import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:flutter/gestures.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#283B71"),
      body: ProgressHUD(
          child: Form(
            child: _loginUI(context),
            key: globalFormKey,
          ),
          key: UniqueKey(),
          inAsyncCall: isAPIcallProcess),
    ));
  }



  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, 
                  Colors.white]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)
              )    
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset(
                      "Assets/images/logo.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                      ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50
            ),
            child: Text("Login",
            style: GoogleFonts.robotoSlab(
              fontSize: 20,
              color: Colors.white
              
            ),),
          ),

          FormHelper.inputFieldWidget(
            context, 
            "username", 
            "UserName", 
            (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Username can\'t be empty";
              }
              return null;
            }, 
            (onSavedValue) {
              userName = onSavedValue;
            },
            prefixIcon: Icon(Icons.person),
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 15
              ),
              child: FormHelper.inputFieldWidget(
              context, 
              "password", 
              "password", 
              (onValidateValue) {
                if (onValidateValue.isEmpty) {
                  return "password can\'t be empty";
                }
                return null;
              }, 
              (onSavedValue) {
                password = onSavedValue;
              },
              prefixIcon: const Icon(Icons.person),
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                }, 
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
                color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 25,
                  top: 10,
                ),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Forget Password ?",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        // recognizer: TapGestureRecognizer()..onTap = () {
                        //   print("Forget Password");
                        // },
                      )
                    ]
                  )
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Center(
              child: FormHelper.submitButton(
                "Login", 
                () {
            
                },
                btnColor: HexColor("#283B71"),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 15,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Center(
              child: Text(
                "OR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 25,
                  top: 10,
                ),
                child: RichText(
                  text:  TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Don't have an account? ",
                      ),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          Navigator.pushNamed(context, "/register");
                        },
                      )
                    ]
                  )
                ),
              ),
            ),
        ],
      ),
    );
  }
}
