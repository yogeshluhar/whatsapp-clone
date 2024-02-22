import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimePass extends StatefulWidget {
  const TimePass({super.key});

  @override
  State<TimePass> createState() => _TimePassState();
}

class _TimePassState extends State<TimePass> {
  List<int> items = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(itemCount: items.length,itemBuilder: (BuildContext context, int index) {
        return Dismissible(background: Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: const FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 20,),
        ),key: ValueKey<int>(items[index]),
            child: const ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/profile/1.jpg',
                  ),
                  radius: 30,
                ),
                title: Text("Text",style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
                subtitle:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.phone,size: 10,color: Colors.red,),
                    Padding(padding: EdgeInsets.only(left: 3)),
                    Text("Missed Calls",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.red),)
                  ],
                )
            ),
        );
        },
      ),
    );
  }
}
