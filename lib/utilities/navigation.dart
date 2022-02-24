
import 'package:astrotak_assignment/screens/account_screen.dart';
import 'package:astrotak_assignment/screens/ask_a_question_screen.dart';
import 'package:astrotak_assignment/screens/friends_and_family_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class Navigation {
  static navigateToScreen(
      {required String? screenId, required RouteSettings settings}) {
    switch (screenId) {
      case AskQuestionScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: const AskQuestionScreen(),
        );
      case AccountScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: const AccountScreen(),
        );
      case FriendsAndFamilyProfileScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: const FriendsAndFamilyProfileScreen(),
        );
    }
  }
}