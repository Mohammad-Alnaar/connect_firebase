import 'package:connect_firebase/app/core/extensions/buid_context_extension.dart';
import 'package:flutter/material.dart';

///[BottomNavBarTabs] custome bottom nav bar items class
abstract class BottomNavBarTabs {
  static List<BottomNavigationBarItem> tabs(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.message_outlined),
        label: context.translate.chats,
        activeIcon: const Icon(Icons.message_outlined),
      ),
      // BottomNavigationBarItem(
      //   icon: const Icon(Icons.location_history),
      //   label: context.translate.location,
      //   activeIcon: const Icon(Icons.location_history),
      // ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: context.translate.profile,
        activeIcon: const Icon(Icons.person),
      ),
    ];
  }
}
