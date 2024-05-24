import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController(); // Added controller for confirm password
  final _formKey = GlobalKey<FormState>();

  Object get passwordRegExp => passwordRegExp;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose(); // Dispose the confirm password controller
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final RegExp emailRegExp =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your email!';
    }
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email!';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final RegExp passwordRegExp = RegExp(r'^.{6,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 6 characters long!';
    }
    return null;
  }

  String? _validateFullName(String? value) {
    final RegExp fullNameRegExp = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (!fullNameRegExp.hasMatch(value)) {
      return 'Please enter a valid full name';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if(value == null){
      return 'Password can\'t be empty' ;
    }
    if (value != passwordRegExp  ) {
      return 'Password does\'t match';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match!';
    }
    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
        child: Form(
        key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const Text(
        'Sign Up to Aeologic',
        style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.black,
    ),
    ),
    const SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Text(
    'Already have an account?',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black26,
    ),
    ),
    const SizedBox(width: 20),
    TextButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
    },
    child: const Text(
    'Login',
    style: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    ),
    ),
    ),
    ],
    ),
    SizedBox(
    height: 70,
    width: 350,
    child: TextFormField(
    controller: _fullNameController,
    decoration: const InputDecoration(
    labelText: 'Full name',
    hintText: 'Enter full Name',
    fillColor: Colors.white70,
    filled: true,
    ),
    validator: _validateFullName,
    ),
    ),
    SizedBox(
    height: 70,
    width: 350,
    child: TextFormField(
    controller: _emailController,
    validator: _validateEmail,
    decoration: const InputDecoration(
    labelText: 'Email',
    hintText: 'Enter Email',
    fillColor: Colors.white70,
    filled: true,
    suffixIcon: Icon(Icons.alternate_email, color: Colors.black12),
    ),
    ),
    ),
    SizedBox(
    height: 70,
    width: 350,
    child: TextFormField(
    controller: _passwordController,
    validator: _validatePassword,
    obscureText: true,
    decoration: const InputDecoration(
    labelText: 'Password',
    hintText: 'Enter Password',
    fillColor: Colors.white70,
    filled: true,
    suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.black12),
    ),
    ),
    ),
    SizedBox(
    height: 70,
    width: 350,
    child: TextFormField(
    controller: _confirmPasswordController,
    validator: _validateConfirmPassword,
    obscureText: true,
    decoration: const InputDecoration(
    labelText: 'Confirm Password',
    hintText: 'Confirm Password',
    fillColor: Colors.white70,
    filled: true,
    suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.black12),
    ),
    ),
    ),
    const SizedBox(height: 20),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: SizedBox(
    height: 50,
    width: 350,
    child: TextButton(
    onPressed: () {
    if (_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign Up Successful')));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));}
    else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error in Values!')),);
        }
    },
    style: TextButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    child: const Text(
    'Create Account',
    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    ),
    ),
    ),
    const Center(
    child: Text(
    'or sign up via',
    style: TextStyle(color: Colors.black45, fontSize: 20, fontWeight: FontWeight.w400),
    ),
    ),
    const SizedBox(height: 20),
    Container(
    height: 50,
    width: 350,
    child: OutlinedButton(
    onPressed: () {
    // Implement sign up with Google
    },
    style: OutlinedButton.styleFrom(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    side: const BorderSide(color: Colors.black, width: 2),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:  [
    Image.asset('assets/images/google.png', height: 30, width: 30),
    SizedBox(height: 20),
    Text('Google', style: TextStyle(color: Colors.black, fontSize: 30)),
    ],
    ),
    ),
    ),
    const SizedBox(height: 10),
    const Text(
    'By signing you agree to our',
    style: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontSize: 20),
    ),
    InkWell(
    onTap: () {
    // Implement terms and conditions
    },
    child: const Text('terms and conditions',
    style: TextStyle(
    color: Colors.blue,
    fontSize: 20,
    fontWeight: FontWeight.w500))),
    ]),
    ),
    )));
  }
}
