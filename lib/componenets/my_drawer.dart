import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vsc/componenets/goodbye.dart';
import 'package:vsc/componenets/my_drawer_tile.dart';
import 'package:vsc/pages/TeamPage.dart';
import 'package:vsc/componenets/constants.dart';
import 'package:vsc/pages/util/camera_live.dart';
import 'package:vsc/pages/util/manegement.dart';

import 'package:vsc/pages/util/settting.dart';
import 'package:vsc/pages/util/static.dart';
import 'package:vsc/pages/util/teamlist.dart';

import 'package:vsc/pages/util/today_screan.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //settings list tile
          MyDrawerTile(
              text: "T E A M",
              icon: Icons.people_sharp,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamPage(),
                  ),
                );
              }),
          MyDrawerTile(
              text: "C A M E R A  H I S T O R Y",
              icon: Icons.camera,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AttendancePage(),
                  ),
                );
              }),
          MyDrawerTile(
            text: "A T T E N D A N C E",
            icon: Icons.check,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerPage(),
                  ));
            },
          ),
          MyDrawerTile(
              text: "M A N A G E M E N T",
              icon: Icons.manage_history,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Management(),
                  ),
                );
              }),
          MyDrawerTile(
              text: "C A M E R A  L I V E",
              icon: Icons.live_tv,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlaskPage(),
                  ),
                );
              }),
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage1(),
                  ));
            },
          ),

          const Spacer(),
          //logout list tile
          MyDrawerTile(
              text: "LOGOUT",
              icon: Icons.logout,
              onTap: () {
                // Sign out Google user
                // Add code to sign out from Supabase here if needed
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  // Navigate to the GoodBye screen
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GoodBye(),
                  ),
                );
              }),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
