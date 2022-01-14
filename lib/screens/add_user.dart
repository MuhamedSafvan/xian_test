import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:xian_test/utils/api_client.dart';
import 'package:xian_test/utils/constants.dart';

class AddUser extends StatelessWidget {
  AddUser({Key? key}) : super(key: key);

  TextEditingController _fNameCtrl = TextEditingController();
  TextEditingController _lNameCtrl = TextEditingController();
  TextEditingController _jobCtrl = TextEditingController();
  Dio dio = Dio();


  showToast(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Successfully Added",
        style: TextStyle(color: Colors.green),
      ),
    ));
  }

  submitAction(BuildContext context) async {
    Response response = await ApiClient().getUsers();
    print(response.statusCode);
    if (_fNameCtrl.text.isNotEmpty &&
        _lNameCtrl.text.isNotEmpty &&
        _jobCtrl.text.isNotEmpty && response.statusCode == 200) {
      showToast(context);
      Navigator.pop(context);
    } else {
      if (_fNameCtrl.text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Please Enter First Name",
            style: TextStyle(color: Colors.red),
          ),
        ));
      }
      if (_lNameCtrl.text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Please Enter Last Name",
            style: TextStyle(color: Colors.red),
          ),
        ));
      }
      if (_jobCtrl.text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Please Enter Job",
            style: TextStyle(color: Colors.red),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                customField(
                    label: 'Enter First Name',
                    controller: _fNameCtrl,
                    errorMsg: 'Please enter the First Name'),
                customField(
                    label: 'Enter Last Name',
                    controller: _lNameCtrl,
                    errorMsg: 'Please enter the Last Name'),
                customField(
                    label: 'Enter Job',
                    controller: _jobCtrl,
                    errorMsg: 'Please enter the Job'),
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: _width,
                height: 60,
                child: TextButton(
                    onPressed: () {
                      submitAction(context);
                    },
                    child: Text(
                      'Submit',
                      style: Constants.boldHeading,
                    )))
          ],
        ),
      ),
    );
  }

  Widget customField(
      {String? label, TextEditingController? controller, String? errorMsg}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMsg;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text('$label'),
          hintText: label,
        ),
      ),
    );
  }
}
