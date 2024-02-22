import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MessageScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const MessageScreen({super.key, required this.userName, required this.userImage});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool show = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 80,
          shadowColor: Colors.grey.shade100,
          backgroundColor: Colors.teal.shade500,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 3),
              const Text(
                "Last seen by today 6:12",
                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left: 5)),
                const Icon(FontAwesomeIcons.arrowLeft, size: 15, color: Colors.white),
                const Padding(padding: EdgeInsets.all(5)),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    widget.userImage,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.video, color: Colors.white, size: 18)),
            IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.phone, color: Colors.white, size: 18)),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text("Media, links, and docs")),
                  const PopupMenuItem(child: Text("Search")),
                  const PopupMenuItem(child: Text("Disappearing messages")),
                  const PopupMenuItem(child: Text("Wallpaper")),
                  const PopupMenuItem(child: Text("More")),
                ];
              },
              icon: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 55,
                        child: Card(
                          margin: const EdgeInsets.only(left: 4, right: 4, bottom: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            controller: _controller,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message",
                              prefixIcon: IconButton(
                                alignment: Alignment.center,
                                icon: const FaIcon(FontAwesomeIcons.faceSmile, color: Colors.grey),
                                onPressed: (){
                                  setState(() {
                                    show = !show;
                                  });
                                },
                              ),
                              contentPadding: const EdgeInsets.only(bottom: 8, left: 5),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: (){
                                        showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (context) => bottomsheetpicker(),);
                                  }, icon: const FaIcon(FontAwesomeIcons.paperclip, color: Colors.grey)),
                                  IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.camera, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.teal.shade500,
                          child: const Icon(
                            FontAwesomeIcons.microphone, size: 15, color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                //   show?emojiSelect():Container(),
                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomsheetpicker(){
    return SizedBox(
      height: 420,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin:const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconsheet(Colors.indigo, FontAwesomeIcons.file, 'Document'),
                  const SizedBox(
                    width: 40,
                  ),
                  iconsheet(Colors.pink, FontAwesomeIcons.camera, 'Camera'),
                  const SizedBox(
                    width: 40,
                  ),
                  iconsheet(Colors.purple, FontAwesomeIcons.image, 'Gallery')
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconsheet(Colors.orange, FontAwesomeIcons.headphones, 'Audio'),
                  const SizedBox(
                    width: 40,
                  ),
                  iconsheet(Colors.green, FontAwesomeIcons.locationDot, 'Location'),
                  const SizedBox(
                    width: 40,
                  ),
                  iconsheet(Colors.blueAccent, FontAwesomeIcons.user, 'Contact'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconsheet(Colors.teal, FontAwesomeIcons.chartSimple, 'Poll'),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconsheet(Color colors,IconData icons,String text){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: colors,
          child: FaIcon(
            icons,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(text,style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),)
      ],
    );
  }

  // Widget emojiSelect(){
  //   return EmojiPicker(
  //     onEmojiSelected: (category, emoji) {
  //       setState(() {
  //         _controller.text = _controller.text + emoji.emoji;
  //       });
  //     },
  //   );
  // }
}
