import 'package:flutter/material.dart';
import 'package:xian_test/utils/constants.dart';

class ContactCard extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final int? id;

  const ContactCard(
      {Key? key, this.firstName, this.lastName, this.email, this.profile, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      // margin: const EdgeInsets.only(top: 8.0,right: 10,left: 10),
      height: 100,
      child: Card(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profile ??
                        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSZ6TeDFGGXiuKR36W9VBw93YeRuOf_-eaDmfqJ1InJONlGKnqV'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 100,
                width: 100,
              ),
              SizedBox(
                width: _width * .08,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      '$firstName $lastName',
                      style: Constants.boldWord,
                    )),
                    Expanded(
                        child: Text(
                      '$email',
                      style: Constants.lightWord,
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
