import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:newproject/base/base_page.dart';
import 'package:newproject/screens/settings_page/settings_vm.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with BasePage<SettingsVM> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text("Settings"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(children: <Widget>[
              const Text(
                "Notification Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  key: UniqueKey(),
                  initiallyExpanded: true,
                  onExpansionChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  trailing: NeumorphicSwitch(
                    style: const NeumorphicSwitchStyle(
                      thumbShape: NeumorphicShape.flat,
                    ),
                    value: isSwitched,
                    height: 30,
                    onChanged: (value) {
                      print("VALUE : $value");

                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                  ),
                  title: const Text(
                    "Email Notification",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff535353)),
                  ),
                  children: <Widget>[
                    isSwitched == true
                        ? SizedBox(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text("Order Updates"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("Order Updates"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("Shipping Updates"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("Promotions"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("Offers"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("News"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("Messages"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  title: const Text("New Arrivals"),
                                  trailing: const NeumorphicSwitch(
                                    height: 30,
                                    value: false,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              ListTile(
                title: const Text("Push Notification"),
                trailing: NeumorphicSwitch(
                  height: 30,
                  value: isSwitched1,
                  onChanged: (value) {
                    print("VALUE : $value");

                    setState(() {
                      isSwitched1 = value;
                      print(isSwitched1);
                    });
                  },
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Notification at Night"),
                trailing: NeumorphicSwitch(
                  height: 30,
                  value: isSwitched2,
                  onChanged: (value) {
                    print("VALUE : $value");

                    setState(() {
                      isSwitched2 = value;
                      print(isSwitched2);
                    });
                  },
                ),
                onTap: () {},
              ),
            ]),
          ),
        ));
  }

  @override
  SettingsVM create() => SettingsVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
