import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xian_test/models/user_model.dart';
import 'package:xian_test/utils/api_provider.dart';
import 'package:xian_test/utils/constants.dart';
import 'package:xian_test/widgets/contact_card.dart';
import 'package:xian_test/widgets/user_profile.dart';

class UserScreen extends StatefulWidget {
  final List<UserData>? userData;

  UserScreen({Key? key, this.userData}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserData>? userData;

  getUsers() async {
    UserResponse? response = await ApiProvider().getUsers(page: 2);
    if (mounted) {
      setState(() {
        userData = response!.data;

      });
    }
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (userData != null) {
      return ListView.builder(
        itemCount: userData!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=> UserProfile(id: userData![index].id,)));
            },
            child: ContactCard(
              firstName: userData![index].firstName,
              lastName: userData![index].lastName,
              email: userData![index].email,
              profile: userData![index].avatar,
              id: userData![index].id,
            ),
          );
        },
      );
    }
    else {
      return const Center(
        child: Text('No data'),
      );
    }
  }
}
