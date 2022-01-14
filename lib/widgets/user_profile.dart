import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xian_test/models/user_model.dart';
import 'package:xian_test/models/user_profile.dart';
import 'package:xian_test/utils/api_provider.dart';
import 'package:xian_test/utils/constants.dart';

class UserProfile extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final int? id;

  const UserProfile(
      {Key? key,
      this.firstName,
      this.lastName,
      this.email,
      this.profile,
      this.id})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ProfileData? userData;

  getUsers() async {
    UserProfileResponse? response =
        await ApiProvider().getUserProfile(id: widget.id);
    print('response $response');
    if (mounted) {
      setState(() {
        userData = response!.data;
      });
    }
    print('widget $userData');
  }

  @override
  void initState() {
    print('${widget.id} ids');
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: userData != null
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                // color: Colors.grey,
                height: _height * .5,
                width: _width,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(
                              '${userData!.avatar}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        // child: Image.network('${userData!.avatar}',fit: BoxFit.cover,),
                        height: _height * .4,
                        width: _width,
                      ),
                      Expanded(
                          child: Text(
                        '${userData?.firstName} ${userData?.lastName}',
                        style: Constants.boldWord,
                      )),
                      Expanded(
                          child: Text(
                        '${userData?.email}',
                        style: Constants.lightWord,
                      )),
                    ],
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
