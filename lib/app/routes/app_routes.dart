part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const animationView = _Paths.animationView;
  static const home = _Paths.home;
  static const details = _Paths.details;
}

abstract class _Paths {
  _Paths._();

  static const animationView = '/animationView';
  static const home = '/home';
  static const details = '/details';
}
