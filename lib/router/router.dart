import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/router/router_handler.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
  static void configureRoutes(){

    // rutas
    router.define('/:page', handler: homeHandler);

    //404
    router.notFoundHandler = homeHandler;
  }
}