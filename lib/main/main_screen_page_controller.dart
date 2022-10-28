
import 'package:flutter/widgets.dart';

import 'main_screen_content.dart';
import 'package:HoFiMeFu/maps/google_map.dart';

class MainPageView extends StatefulWidget {
  @override
  MainPageViewState createState() => MainPageViewState();
}

class MainPageViewState extends State<MainPageView> {

  PageController _controller = PageController(
    initialPage: 1,
  );

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      
      children: [
        MainScreenContent(), //TODO Left Screen ?
        Map(), //TODO Main Screen 
        MainScreenContent(), //TODO Friends/Chat screen
      ],
    );
  }
}