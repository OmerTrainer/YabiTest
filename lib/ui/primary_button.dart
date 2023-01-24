import 'package:flutter/material.dart';
import 'package:yabi_test/utils/device_utils.dart';

class PrimaryButton extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final Function onPress;
  final bool shouldShowIcon;
  final double minWidth;
  final bool isBorder;
  const PrimaryButton({
    Key? key,
    this.backgroundColor = const Color(0xFF6D41CB),
    this.buttonText = '',
    this.shouldShowIcon = false,
    this.textColor = Colors.white,
    this.minWidth = 100,
    this.isBorder = false,
    required this.onPress,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          widget.onPress();
        },
        child: Container(
          height: DeviceUtils.getScaledHeight(context, 0.05),
          constraints: BoxConstraints(
            minWidth: widget.minWidth,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
            border: widget.isBorder
                ? Border.all(color: const Color(0xFF6D41CB))
                : null,
          ),
          child: Center(
            child: Row(
              children: [
                widget.shouldShowIcon
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 8.0,
                          bottom: 8.0,
                        ),
                        child: Image.asset(
                          'assets/PlusIcon.png',
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      fontSize: DeviceUtils.getScaledFontSize(context, 16),
                      color: widget.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
