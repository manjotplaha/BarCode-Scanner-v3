import 'package:barcode_scanner_v3/Provider/AuthService.dart';
import 'package:barcode_scanner_v3/shared/widgets/bars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: buildAppBar(context, 'User Profile'),
      body: FutureBuilder(
          future: Provider.of<AuthService>(context).getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                child: UserProfileInfo(context, snapshot),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;
  UserProfileInfo(this.context, this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            // backgroundImage: NetworkImage("${snapshot.data.photoUrl}"),
            backgroundImage: buildProfileImage(snapshot, context),
            radius: 40.0,
          ),
        ),
        Divider(height: 60.0, color: Colors.grey[750]),
        Text(
          'NAME: ',
          style: TextStyle(color: Colors.grey, letterSpacing: 1.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "${snapshot.data.displayName}",
          style: TextStyle(
            color: Colors.amberAccent[200],
            letterSpacing: 1.0,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.email,
              color: Colors.grey[400],
            ),
            SizedBox(
              width: 7.0,
            ),
            Text(
              "${snapshot.data.email}",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18.0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.phone,
              color: Colors.grey[400],
            ),
            SizedBox(
              width: 7.0,
            ),
            Text(
              "${snapshot.data.phoneNumber}",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18.0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        )
      ],
    );
  }

  dynamic buildProfileImage(AsyncSnapshot snapshot, BuildContext context) {
    if (snapshot.data.isAnonymous == true) {
      return AssetImage('assets/images/anonymous-user.png');
    } else if (snapshot.data.isAnonymous == false) {
      return NetworkImage(snapshot.data.photoURL);
    }
  }
}
