 
import 'package:flutter/material.dart';

 
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.only(top: 100.0),

      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Text(
                'Dummmy Dealer',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Drawer Item 1'),
              onTap: () {
                // Handle drawer item 1 press
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Drawer Item 2'),
              onTap: () {
                // Handle drawer item 2 press
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}