import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/system_category_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/routes/go_router_constants.dart';
import 'package:restaurantmanagement/src/constants/utils/app_spacing.dart';
import 'package:restaurantmanagement/src/constants/utils/app_font_style.dart';
import 'package:restaurantmanagement/src/features/dashboard/presentation/dashboard_page.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  bool isNavbarOpen = true;

  List<Widget> list = [
    const DashBoardPage(),
  ];

  User _user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Visibility(
            visible: isNavbarOpen,
            child: Container(
              width: 100, // Adjust the width as needed
              color: const Color.fromARGB(255, 21, 21, 21),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? Colors
                                          .blue // Set to blue for selected index
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Center(
                                child: Text('${index + 1}'),
                              ),
                            ],
                          ),
                          selected: _selectedIndex == index,
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _dialogBuilder(context);
                        // Add button tap action
                        Klog.logMessage("Add button pressed");
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    verticalSpacing12,
                    GestureDetector(
                      onTap: () {
                        context.push(NamedRoute.PROFILE_PAGE);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(_user.photoURL ?? "Profile"),
                          ),
                        ),
                      ),
                    ),
                    verticalSpacing12
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: list[_selectedIndex],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isNavbarOpen = !isNavbarOpen;
          });
        },
        child: Icon(isNavbarOpen ? Icons.minimize : Icons.open_in_full),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        alignment: Alignment.center,
        title: const Text(
          'Create a system',
          style: KFontStyle.h2Style,
        ),
        content: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SystemCategoryWidget(onTap: () {}, title: 'Inventory'),
                SystemCategoryWidget(
                    onTap: () {
                      context.pushNamed(NamedRoute.CREATE_RESTURANT);
                    },
                    title: 'Restaurant'),
                SystemCategoryWidget(onTap: () {}, title: 'Social Media Shop'),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: MaterialButton(
              splashColor: Colors.red,
              child: Text(
                "Cancel",
                style: KFontStyle.buttonBold.copyWith(color: Colors.redAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
