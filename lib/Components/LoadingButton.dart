

import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {

  final Widget child;
  final Function()? onPressed;
  final bool isDisabled;
  final ButtonStyle style;

  const LoadingButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.style,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style,
      onPressed: widget.isDisabled
          ? null :
          () async {
        setState(() {
          isLoading = true;
        });
        if (widget.onPressed != null) {
          await widget.onPressed!();
        }
        setState(() {
          isLoading = false;
        });
      },
      child: (isLoading != null && isLoading)
          ? SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : widget.child,
    );
  }
}
