/*
 * fluro
 * A Posse Production
 * http://goposse.com
 * Copyright (c) 2018 Posse Productions LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

///
enum HandlerType {
  route,
  function,
  future,
}

///
class Handler {
  Handler({this.type = HandlerType.route, this.handlerFunc});
  final HandlerType type;
  final HandlerFunc handlerFunc;
}

///
typedef Route<T> RouteCreator<T>(
  RouteSettings route, 
  Map<String, List<String>> parameters,
);

///
typedef dynamic HandlerFunc(
  BuildContext context, 
  Map<String, List<String>> parameters, 
  [dynamic object]
);

///
class AppRoute {
  String route;
  dynamic handler;
  AppRoute(this.route, this.handler);
}

enum RouteMatchType {
  visual,
  nonVisual,
  noMatch,
}

///
class RouteMatch {
  RouteMatch({
    this.matchType = RouteMatchType.noMatch,
    this.route,
    this.errorMessage = "Unable to match route. Please check the logs.",
    this.handler,
    this.parameters,
    this.object
  });

  final Route<dynamic> route;
  final RouteMatchType matchType;
  final String errorMessage;
  final Handler handler;
  final Map<String, List<String>> parameters;
  final dynamic object;
}
