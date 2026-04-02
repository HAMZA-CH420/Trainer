import 'package:flutter/material.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() => widget.onChanged(controller.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * .06,
      width: size.width,

      padding: EdgeInsets.only(left: 10, top: 5),
      decoration: BoxDecoration(
        color: Color(0xFFE8EDF5),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Palette.primaryColor, size: 34),
          hintText: "Search for trainers",
        ),
      ),
    );
  }
}
