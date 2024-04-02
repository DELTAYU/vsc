import 'package:flutter/material.dart';
import 'package:vsc/componenets/my_drawer_tile.dart';

import 'package:vsc/pages/util/acount.dart';
import 'package:vsc/pages/util/list_view.dart';

import 'package:vsc/pages/util/today_screan.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
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
                    builder: (context) => const ListViewBuilder(),
                  ),
                );
              }),
          MyDrawerTile(
              text: "A T T E N D A N C E",
              icon: Icons.stacked_bar_chart,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodayScreen(),
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
                    builder: (context) => const AccountScreen(),
                  ));
            },
          ),

          const Spacer(),
          //logout list tile
          MyDrawerTile(text: "L O G O U T", icon: Icons.logout, onTap: () {}),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
