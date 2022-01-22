import 'package:flutter/material.dart';
import 'package:untitled/pages/chips_page.dart';
import 'package:untitled/pages/dialog_page.dart';
import 'package:untitled/pages/nickname_page.dart';

const _dialog = '/dialog';
const _nickname = '/nickname';
const _chips = '/chips';

class ProjectRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _nickname:
        return _buildRoute(const NicknamePage());
      case _dialog:
        return _buildRoute(const DialogPage());
      case _chips:
        return _buildRoute(const ChipsPage());
      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}

enum Routes { nickname, dialog, splash, chips }

extension RoutNames on Routes {
  String get name {
    switch (this) {
      case Routes.nickname:
        return _nickname;
      case Routes.dialog:
        return _dialog;
      case Routes.splash:
        return '';
      case Routes.chips:
        return _chips;
    }
  }

}
