import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/constants/utils/app_colors.dart';

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold({
    Key? key,
    required this.body,
    this.title,
    this.leadingIcon,
    this.onLeadingPress,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.removePadding = false,
    this.isTitleActive = false,
  }) : super(key: key);

  final Widget body;
  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPress;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool removePadding;
  final bool isTitleActive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: isTitleActive
          ? AppBar(
              leading: IconButton(
                onPressed: onLeadingPress ??
                    () {
                      //context.router.pop();
                      Navigator.of(context).pop();
                    },
                icon: Icon(
                  leadingIcon ?? Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(title ?? ''),
              actions: actions,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: removePadding ? EdgeInsets.zero : const EdgeInsets.all(20),
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
