import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController=  TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    userNameController.clear();
    passwordController.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text('Login',  style: GoogleFonts.montserrat(
              textStyle:const TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
            ),)),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF706F6F)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children:[
                        const Icon(Icons.person,size: 25,),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: TextField(
                            controller: userNameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  //width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF706F6F)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.lock,size: 25,),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter password'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        HomePage()));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.red,
                    ),
                    child: Center(child: Text('Login',  style: GoogleFonts.montserrat(
                      textStyle:const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                    ),)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        SignUpPage()));
                  },
                  child: Center(child: Text('don\'t have an account ! sign up',  style: GoogleFonts.montserrat(
                    textStyle:const TextStyle(color: Colors.black, fontSize: 12,),
                  ),)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
