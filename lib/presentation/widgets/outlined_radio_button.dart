import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OutlinedRadioButton extends StatefulWidget {
  final String label;
  final int index;
  int current;
  Function(int index) onChange;
  OutlinedRadioButton(
      {Key? key,
      required this.label,
      required this.index,
      required this.current,
      required this.onChange})
      : super(key: key);

  @override
  _OutlinedRadioButtonState createState() => _OutlinedRadioButtonState();
}

class _OutlinedRadioButtonState extends State<OutlinedRadioButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          widget.current = widget.index;
        });
        widget.onChange(widget.index);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              color: widget.current == widget.index ? Colors.white : null,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      style: widget.current == widget.index
          ? TextButton.styleFrom(
              backgroundColor: const Color(0xFF0B6EFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Color(0xFF0B6EFE),
                ),
              ),
            )
          : TextButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Colors.blue,
                ),
              ),
            ),
    );
  }
}
