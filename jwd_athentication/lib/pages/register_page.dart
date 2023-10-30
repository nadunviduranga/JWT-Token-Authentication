import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:flutter/gestures.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? email;

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#283B71"),
      body: ProgressHUD(
          child: Form(
            child: _registerUI(context),
            key: globalFormKey,
          ),
          key: UniqueKey(),
          inAsyncCall: isAPIcallProcess),
    ));
  }

  Widget _registerUI(BuildContext context) {
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
            child: Text("Register",
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
                top: 15,
              ),
              child: FormHelper.inputFieldWidget(
              context, 
              "email", 
              "Email", 
              (onValidateValue) {
                if (onValidateValue.isEmpty) {
                  return "Email can\'t be empty";
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

            

            const SizedBox(
              height: 20,
            ),

            Center(
              child: FormHelper.submitButton(
                "Register", 
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


