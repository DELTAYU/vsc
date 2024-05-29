import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage1 extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  bool isLoading = false;
  String? _error;

  final supabase = Supabase.instance.client;

  Future<void> _signUp() async {
    setState(() {
      isLoading = true;
      _error = null;
    });

    try {
      final response = await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
        data: {'full_name': fullNameController.text},
      );
      if (response.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                HomePage(), // Replace with your home page widget
          ),
        );
      }
    } on AuthException catch (e) {
      setState(() {
        _error = e.message;
      });
    } catch (e) {
      setState(() {
        _error = 'An unexpected error occurred: $e';
      });
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _error,
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _error,
                ),
                obscureText: true,
              ),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              ElevatedButton(
                onPressed: isLoading ? null : _signUp,
                child:
                    isLoading ? CircularProgressIndicator() : Text('Sign Up'),
              ),
              if (_error != null) ...[
                SizedBox(height: 20),
                Text(
                  _error!,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
