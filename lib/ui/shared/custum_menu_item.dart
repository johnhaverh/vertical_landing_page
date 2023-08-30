import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class CustommenuItem extends StatefulWidget {
  
  final String text;
  final Function onPressed;
  final int delay;

  const CustommenuItem({super.key, required this.text, required this.onPressed, required this.delay});
  

  @override
  State<CustommenuItem> createState() => _CustommenuItemState();
}

class _CustommenuItemState extends State<CustommenuItem> {
  
  bool isHover = false;
  
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      duration: Duration(milliseconds: 150),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 150,
            height: 50,
            color: isHover ? Colors.pinkAccent : Colors.black,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
                ),
            ),
    
            )
          
        ),
      ),
    );
  }
}