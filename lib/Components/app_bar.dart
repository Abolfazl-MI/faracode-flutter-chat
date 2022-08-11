import 'package:faracode_flutter_chat/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height *0.09,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Colors.grey,
        //TODO : HARDCODE
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
          Container(
            margin: EdgeInsets.only(right: 80),
            child: Row(children: [
               IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
              CircleAvatar(
                maxRadius: 25,
                backgroundImage: AssetImage(Assets.images.profileTest.path),
              ),
              SizedBox(
                width: 8,
              ),
              Text("shoebir seifi",
                  style: Theme.of(context).textTheme.headline1),
            ]),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}

