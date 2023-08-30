import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isOpen ? 50 : 0,
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
        ),
      ),
    );
  }
}