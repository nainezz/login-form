// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 85,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/59535592?v=4',
                    width: 70,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abdi A Mohamed ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('mobile devolper'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/user.svg'),
            ),
            title: Text('Personal Data'),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/cog.svg'),
            ),
            title: Text(' Settings'),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/reports.svg'),
            ),
            title: Text(' E-Statement'),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/heart.svg'),
            ),
            title: Text('Refferal Code '),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/chart.svg'),
            ),
            title: Text(' FAQs '),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/pencil.svg'),
            ),
            title: Text(' FAQs '),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.04),
              ),
              child: SvgPicture.asset('images/users.svg'),
            ),
            title: Text(' FAQs '),
            trailing: SvgPicture.asset('images/chevron.svg'),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'http://clipart-library.com/image_gallery/49658.png',
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Feel Free to Ask , We Ready to Help',
                      style: TextStyle(color: Colors.purple, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
