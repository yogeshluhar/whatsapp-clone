import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_view/story_view.dart';

class MyStoryView extends StatefulWidget {
  const MyStoryView({super.key});

  @override
  State<MyStoryView> createState() => _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryView> {
  final List<String> story = [
    'assets/profile/1.jpg',
    'assets/profile/2.jpg',
    'assets/profile/3.jpg',
    'assets/profile/4.jpg',
    'assets/profile/5.jpg',
    'assets/profile/6.jpg',
    'assets/profile/7.jpg',
    'assets/profile/8.jpg',
    'assets/profile/9.jpg',
    'assets/profile/10.jpg',
    'assets/profile/11.jpg',
    'assets/profile/12.jpg',
    'assets/profile/13.jpg',
  ];
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         children: [
           ListTile(
             leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               icon:const FaIcon(FontAwesomeIcons.arrowLeft,size: 15,),
               color: Colors.black,
             ),
           ),

           Expanded(
             child: StoryView(
               storyItems: story.map((url) => StoryItem.pageImage(
                 url: url,
                 controller: controller,
                 imageFit: BoxFit.contain,
               )).toList(),
               controller: controller,
               onComplete: () {
                 Navigator.pop(context);
                 // Callback when the story completes
               },
             ),
           ),

         ],
       ),
     );
  }
}

