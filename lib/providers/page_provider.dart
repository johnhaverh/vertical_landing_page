//import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;


class PageProvider extends ChangeNotifier {

  PageController scrollController = PageController();

  final List<String> _pages = ['home','about', 'pricing','contact','location'];
  int _currentIndex= 0;

  createScrollController(String routeName){
    scrollController = PageController(initialPage: getPageIndex(routeName));
    html.document.title = _pages[getPageIndex(routeName)];

    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();
      if(index != _currentIndex) {
        html.window.history.pushState(null, '', '#/${_pages[index]}' );
        html.document.title =_pages[index];
        _currentIndex = index;
      }
    });
  }

  getPageIndex(String routeName){
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index){
    //final routeName = _pages[index];
    //html.window.history.pushState(null, '', '#/${_pages[index]}' );
    scrollController.animateToPage(
      index, 
      duration: Duration(milliseconds: 300), 
      curve: Curves.easeInOut,
    );
  }
}