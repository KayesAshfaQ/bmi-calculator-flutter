import 'package:flutter/material.dart';

import '../constants.dart';

class CircleIconButton extends StatelessWidget {
  final GlobalKey<TooltipState>? tooltipKey = GlobalKey<TooltipState>();
  final String? tooltip;
  final IconData? icon;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress;
  final Function(LongPressEndDetails)? onLongPressEnd;

  CircleIconButton({
    super.key,
    this.tooltip = 'button',
    this.icon,
    this.onPress,
    this.onLongPress,
    this.onLongPressEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // show tooltip
        tooltipKey?.currentState?.ensureTooltipVisible();

        // delay the long press action
        Future.delayed(const Duration(milliseconds: 250), onLongPress);
      },
      onLongPressEnd: onLongPressEnd,
      child: Tooltip(
        key: tooltipKey,
        message: tooltip,
        triggerMode: TooltipTriggerMode.manual,
        child: RawMaterialButton(
          shape: const CircleBorder(),
          fillColor: kColorCircleButton,
          highlightColor: kColorBottomContainer.withOpacity(0.25),
          constraints: const BoxConstraints.tightFor(height: 50.0, width: 50.0),
          elevation: 6.0,
          onPressed: onPress,
          child: Icon(icon),
        ),
      ),
    );
  }
}
