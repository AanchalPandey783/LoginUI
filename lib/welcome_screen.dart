import 'package:flutter/material.dart';
import 'package:u_ui_design/custom_scaffold.dart';
import 'package:u_ui_design/sign_in.dart';
import 'package:u_ui_design/sign_up.dart';

class NewUi extends StatelessWidget {
  const NewUi({super.key});

  @override

  Widget build(BuildContext context) {
    return CustomScaffold(

      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(child: Text('Welcome ')),
            Padding(
              padding: const EdgeInsets.only(top:630, left:50, right:50, bottom:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  TextButton(child: const Text('Sign In'),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
        
                  }),
                  TextButton(child: const Text('Sign Up'),
                      onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                      },        )    ]
              ),
            )
          ]
        ),
      )

    );
  }
}

Widget _buildInputField(TextEditingController controller, {isPassword = false}
){
  return TextField(
    controller:controller,

  );

}
