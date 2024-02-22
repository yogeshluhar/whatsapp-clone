import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/Call/calls.dart';
import 'package:whatsapp/Data/calldata.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Call();
              },
            ),
          );
        },
        backgroundColor: Colors.teal.shade500,
        child: const FaIcon(
          FontAwesomeIcons.phone,
          color: Colors.white,
          size: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                child: FaIcon(
                  FontAwesomeIcons.link,
                  size: 15,
                  color: Colors.white,
                ),
              ),
              title: Text("Create call link",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w600,fontSize: 20,),),
              subtitle: Text("Share a link for your WhatsApp call",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 14,),),
            ),
            const Row(
              children: [
                Padding(padding: EdgeInsets.all(14)),
                Text("Recent",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
              ],
            ),

            //----------------------------- Call -----------------------------------

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagelist.length, (index) {
                CallData calldata = imagelist[index];

                return ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      calldata.images,
                    ),
                    radius: 30,
                  ),
                    title: Text(calldata.names,style:const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
                    subtitle:const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.phone,size: 10,color: Colors.red,),
                        Padding(padding: EdgeInsets.only(left: 3)),
                        Text("Missed Calls",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.red),)
                      ],
                    ),
                    trailing: Container(
                      margin:const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.phone,
                          color: Colors.teal.shade200,
                          size: 15,
                        ),
                        onPressed: (){
                        },
                        hoverColor: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
