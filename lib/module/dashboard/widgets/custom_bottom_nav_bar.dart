
import 'package:flutter/material.dart';
import '../../../utils/custom_colors.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  final Color backGroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int)? onChange;
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, this.backGroundColor = backgroundColor, this.itemColor = primaryColor, this.currentIndex = 0, required this.children, this.onChange});

  @override
  CustomBottomNavigationBarState createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backGroundColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0)),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          var color = item.color ?? widget.itemColor;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _changeIndex(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.currentIndex == index ? MediaQuery.of(context).size.width / widget.children.length + 20 : 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: widget.currentIndex == index ? color.withOpacity(0.2) : Colors.transparent, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 24,
                    color: widget.currentIndex == index ? color : color.withOpacity(0.5),
                  ),
                  widget.currentIndex == index
                      ? Expanded(
                    flex: 2,
                    child: Text(
                      label ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: widget.currentIndex == index ? color : color.withOpacity(0.5)),
                    ),
                  )
                      : Container()
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color? color;

  CustomBottomNavigationItem({required this.icon, required this.label, this.color});
}