import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text('George Mackali'), 
          accountEmail: Text('Georgemackali@gmail.com'),
          currentAccountPicture: CircleAvatar(),),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text('Upload your file'),
            onTap: () {
              print('upload successfully');
            },
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text('Upload your file'),
            onTap: () {
              print('upload successfully');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('View Your Profile'),
            onTap: () {
              print('upload successfully');
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Shared your file'),
            onTap: () {
              print('shared successfully');
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: Text('please view your notifications'),
            onTap: () {
              print('view notifications successfully');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('edit your settings'),
            onTap: () {
              print(' successfully edited');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              print(' successfully Log out');
            },
          )
        ],
      ),
    );
    
  }
}