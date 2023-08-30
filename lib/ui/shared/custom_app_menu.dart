import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custum_menu_item.dart';

class CustomAppMenu extends StatefulWidget {

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {

  bool isOpen = false;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration( milliseconds: 200 ));
  }

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor:SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){ 
          if ( isOpen ) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) 
              ...{
                CustommenuItem(delay: 0, text: 'Home', onPressed: () => pageProvider.goTo(0)),
                CustommenuItem(delay: 30, text: 'About', onPressed: () => pageProvider.goTo(1)),
                CustommenuItem(delay: 60, text: 'Pricing', onPressed: () => pageProvider.goTo(2)),
                CustommenuItem(delay: 90, text: 'Contact', onPressed: () => pageProvider.goTo(3)),
                CustommenuItem(delay: 120, text: 'Location', onPressed: () => pageProvider.goTo(4)),
                SizedBox(height:8),
              }
            ],
          )
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    super.key,
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
            ),
          Text('Menu',style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            progress: controller,
            color: Colors.white
          )
          //Icon(Icons.menu, color: Colors.white,),
        ],
      ),
    );
  }
}