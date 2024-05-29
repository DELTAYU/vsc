import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlaskPage extends StatefulWidget {
  @override
  _FlaskPageState createState() => _FlaskPageState();
}

class _FlaskPageState extends State<FlaskPage> {
  String _response = '';

  void _getData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:5000'));
      if (response.statusCode == 200) {
        setState(() {
          _response = response.body;
        });
      } else {
        setState(() {
          _response = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flask URL Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _getData,
              child: Text('Get Data'),
            ),
            SizedBox(height: 20),
            Text('Response: $_response'),
          ],
        ),
      ),
    );
  }
}
