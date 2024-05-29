// Inside your NotificationDetailScreen widget

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class NotificationModel {
  final name;
  final time;
  final imageUrl;

  NotificationModel({
    required this.name,
    required this.time,
    required this.imageUrl,
  });
}

class NotificationDetailScreen extends StatelessWidget {
  final NotificationModel notification;

  NotificationDetailScreen(this.notification);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Time: ${notification.time}'),
            SizedBox(height: 20),
            Image.network(
              notification.imageUrl,
              height: 200, // Set the desired height for the image
            ),
            SizedBox(height: 20),
            const Text('unkown person at the door'),
            ElevatedButton(
              onPressed: () {
                launch('tel:95998708'); // Replace '
              },
              child: const Text('Call Security Guards'),
            ),
            ElevatedButton(
              onPressed: () {
                //      gpioController.setPin(17, GpioPinValue.high); // Replace 17 with the GPIO pin connected to your door relay
                // Add a delay if necessary to keep the door open for a certain duration
                // Future.delayed(Duration(seconds: 5), () {
                //   gpioController.setPin(17, GpioPinValue.low); // Turn off the GPIO pin after a delay
                // });
              },
              child: Text('Door access'),
            ),
          ],
        ),
      ),
    );
  }
}

// Inside your ListView.builder


//  Documentation

// import 'package:flutter/material.dart';
// import 'package:flutter_gpio/flutter_gpio.dart';

// class DoorControlScreen extends StatelessWidget {
//   final GpioController gpioController = GpioController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Door Control'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             gpioController.setPin(17, GpioPinValue.high); // Replace 17 with the GPIO pin connected to your door relay
//             // Add a delay if necessary to keep the door open for a certain duration
//             // Future.delayed(Duration(seconds: 5), () {
//             //   gpioController.setPin(17, GpioPinValue.low); // Turn off the GPIO pin after a delay
//             // });
//           },
//           child: Text('Open Door'),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     gpioController.dispose(); // Clean up the GPIO controller when the widget is disposed
//     super.dispose();
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'Door Control App',
//     home: DoorControlScreen(),
//   ));
// }
