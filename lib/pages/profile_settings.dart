import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goose_flutter_assignment/features/profile_settings.dart';
import 'package:provider/provider.dart';

import '../Providers/authentication_handler.dart';
import '../Providers/profile_settings_handler.dart';
import '../constants.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: UIColors.backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text("Profile Settings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChangeNotifierProvider(
                create: (context) => AuthenticationHandler(),
                child: const ProfilePicture()),
            CustomListTile(
              title: "Personal Information",
              icon: const Icon(
                Icons.person,
                color: Color(0xFF12D18E),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
            CustomListTile(
              title: "Push Notifications",
              subtitle: "Receive alerts for bid activity",
              icon: const Icon(
                Icons.notifications,
                color: Color(0xFFFBA92F),
              ),
              actions: [
                CupertinoSwitch(
                  value: context
                      .watch<ProfileSettingsHandler>()
                      .pushNotificationsSwitch,
                  onChanged: (switchValue) {
                    context
                        .read<ProfileSettingsHandler>()
                        .changePush(switchValue);
                  },
                  activeColor: UIColors.primaryColor,
                ),
              ],
            ),
            CustomListTile(
              title: "Subscribe to Emails",
              subtitle: "Receive marketing emails",
              icon: const Icon(
                Icons.email,
                color: Color(0xFF3B7AFC),
              ),
              actions: [
                CupertinoSwitch(
                  value: context
                      .watch<ProfileSettingsHandler>()
                      .emailSubscriptionSwitch,
                  onChanged: (switchValue) {
                    context
                        .read<ProfileSettingsHandler>()
                        .changeSubscription(switchValue);
                  },
                  activeColor: UIColors.primaryColor,
                ),
              ],
            ),
            CustomListTile(
              title: "Language",
              icon: const Icon(
                Icons.info,
                color: Color(0xFFA06450),
              ),
              actions: [
                const Text(
                  "English (US)",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
            CustomListTile(
              title: "Change Password",
              icon: const Icon(
                Icons.shield,
                color: Color(0xFF46DAA6),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
            CustomListTile(
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<AuthenticationHandler>().logout();
                    },
                    icon: const Icon(Icons.keyboard_arrow_right))
              ],
              title: "Logout",
              icon: const Icon(
                Icons.exit_to_app,
                color: Color(0xFFFA6566),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   backgroundColor: UIColors.backgroundColor,
      //   currentIndex: 0,
      //   onTap: (p0) {}, items: [
      //     CustomBottomNavigationBarItems(label: "Home", icon: Icons.home)
      //   ], active: null,
      // ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
