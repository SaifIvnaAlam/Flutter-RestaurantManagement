import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/constants/utils/app_spacing.dart';
import 'package:restaurantmanagement/src/features/dashboard/presentation/dashboard_page.dart';

class DiscordSidebar extends StatefulWidget {
  const DiscordSidebar({Key? key}) : super(key: key);

  @override
  _DiscordSidebarState createState() => _DiscordSidebarState();
}

class _DiscordSidebarState extends State<DiscordSidebar> {
  int _selectedIndex = 0;
  bool isNavbarOpen = true;

  List<Widget> list = [
    DashBoardPage(),
    Page2(),
    Page3(),
  ];

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
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(Icons.add),
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
        title: const Text('Create a system'),
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('Restaurant'),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 3'),
      ),
    );
  }
}
