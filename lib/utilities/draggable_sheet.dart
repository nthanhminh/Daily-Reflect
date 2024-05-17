import 'package:flutter/material.dart';

class DraggableSheet extends StatefulWidget {
  final Widget child;
  const DraggableSheet({super.key, required this.child});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}
class _DraggableSheetState extends State<DraggableSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() { });
  }
  void onChanged() {
    final currentSize = controller.size;
    if(currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);
  void anchor() => animateSheet(getSheet.snapSizes!.last);
  void expand() => animateSheet(getSheet.maxChildSize);
  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(size, duration: const Duration(microseconds: 50), curve: Curves.easeInOut);
  }

  DraggableScrollableSheet get getSheet => (sheet.currentWidget as DraggableScrollableSheet);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builer, constraints) {
        return DraggableScrollableSheet(
          key: sheet,
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          minChildSize: 0,
          expand: true,
          snap: true,
          snapSizes: [
            60/constraints.maxHeight,
            0.5
          ],
          builder: ((context, scrollController) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))  
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: widget.child
                  )
                ]
              )
            );
          })
        );
      },
    );
  }
}