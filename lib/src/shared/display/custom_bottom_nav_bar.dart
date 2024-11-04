import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nishauri/src/features/common/presentation/pages/chat_feeback_form.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int messagesCount;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.messagesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).disabledColor,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/Home.svg"),
          label: "Home",
          activeIcon: SvgPicture.asset("assets/images/Home-Active.svg"),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/Modules.svg"),
          label: "Apps",
          activeIcon: SvgPicture.asset("assets/images/Modules-active.svg"),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/Chatbot.svg"),
          label: "Ask Nuru",
          activeIcon: SvgPicture.asset("assets/images/Chatbot-Active.svg"),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/Settings.svg"),
          label: "Settings",
          activeIcon: SvgPicture.asset("assets/images/Settings-Active.svg"),
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) async {
        if (currentIndex == 2 && index != 2 && messagesCount > 2) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              content: Stack(
                children: [
                  const ChatFeedbackForm(),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.xmark),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        // Update current index
        onTap(index);
      },
    );
  }
}
