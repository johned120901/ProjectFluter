import 'package:app1/util/colors.dart';
import 'package:app1/util/resize.dart';
import 'package:app1/util/styles.dart';
import 'package:app1/view/widgets/app_button.dart';
import 'package:app1/view/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/backbit.png'),
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.softLight),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colorBlanco.withAlpha(100),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    //top: 40,
                    top: ResizeH(_Height, 40),
                    left: 25,
                    right: 25),
                height: _Height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 15)],
                  color: colorBlanco,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(130),
                    bottomRight: Radius.circular(130),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to",
                      style: GoogleFonts.signika(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ResizeH(
                          _Height,
                          20,
                        ),
                      ),
                    ),
                    Image.asset('assets/img/BitLogo.png',
                        width: ResizeH(_Height, 157),
                        height: ResizeH(_Height, 63),
                        fit: BoxFit.contain),
                    Text(
                      'Please login to continue',
                      style: GoogleFonts.signika(
                        fontSize: ResizeH(_Height, 20),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: _Height*0.05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppTextField(hintText: 'Username', icon: Icon(Icons.person, color: Colors.grey),),
                    ),
                    SizedBox(
                      height: _Height*0.02,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppTextField(hintText: 'Password', icon: Icon(Icons.lock, color: Colors.grey,), obscureText: true,),
                    ),
                    SizedBox(
                      height: _Height*0.01,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?'
                      ),
                    ),
                    SizedBox(
                      height: _Height*0.05,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: AppButton(text: 'LOGIN', onPressed: () {
                          Navigator.pushReplacementNamed(context, '/news');
                        }))
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox()),
              Text(
                'OR',
                style: Styles.secondaryTextSyle,
              ),
              Expanded(
                  child: SizedBox()),
              AppButton(text: 'SING UP', onPressed: () {}),
              Expanded(
                  flex: 2,
                  child: SizedBox())
            ],
          ),
        ],
      ),
    ));
  }
}
