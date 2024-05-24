import 'package:flutter/material.dart';
import 'package:u_ui_design/home_screen.dart';

class SignInWindow extends StatelessWidget {
   const SignInWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInScreen(),
    );
  }
}


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  String? _validateEmail(String?value){
    final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9._]+\.[a-zA-z]{2,}$');
    if (value==null||value.isEmpty){
      return 'Please enter your email!';
    }
    if( !emailRegExp.hasMatch(value)){
      return 'Please enter your email!';
    }
    return null;
  }
  String? _validatePassword(String ?value){
    final RegExp passwordRegExp= RegExp(r'^[\d{6]$');
    if(value==null||value.isEmpty){
      return 'Please enter password';
    }
    if(!passwordRegExp.hasMatch(value)){
      return 'Please enter 6 digit password!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
        SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const Text('Welcome back! \nSign In to Aeologic',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text('Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black26)),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 30,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: TextFormField(
                        controller : _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white70,
                          filled: true,
                          suffixIcon:
                          Icon(Icons.alternate_email, color: Colors.black12),
                        ),
              validator: _validateEmail,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: TextFormField(
                        controller: _passwordController,
                        validator: _validatePassword,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white70,
                            filled: true,
                            suffixIcon: Icon(Icons.visibility_off_outlined,
                                  color: Colors.black12),
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 30,
                      width: 350,

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: SizedBox(
                        height: 50,
                        width: 350,
                        child: TextButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful!')),);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));}
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error in Values!')),);
                                    }

                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                    const Center(
                        child: Text('or sign in via',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 20,
                                fontWeight: FontWeight.w400))),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height:50, width:350,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            side: const BorderSide(color: Colors.black, width: 2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(height:20),
                            const Text(
                                'Google',
                                style: TextStyle(color: Colors.black, fontSize: 30)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'By signing you agree to our',
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                    InkWell(
                        onTap: () {},
                        child: const Text('terms and conditions',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w500))),
                  ]),
            ),
          ),
        ));
  }
}
