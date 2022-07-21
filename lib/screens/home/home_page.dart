import 'package:flutter/material.dart';
import 'package:newproject/screens/settings_page/settings.dart';
import '/base/base_page.dart';
import '/screens/home/home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BasePage<HomePageVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  accountName: Text("Abhishek Mishra"),
                  accountEmail: Text("abhishekm977@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            // backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Products",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 4.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          // height: 200,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(provider
                                                  .productList[index].image ??
                                              ""),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  provider.productList[index].title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14),
                                ),
                                Text(
                                  provider.productList[index].category
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2F2F3E)),
                                ),
                                Text(
                                  provider.productList[index].description
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2F2F3E)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 26.0 / 15.0,
                          child: Container(
                            // height: 600,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        provider.productList[index].image ??
                                            ""),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  provider.productList[index].title.toString()),
                              const SizedBox(height: 8.0),
                              Text(
                                provider.productList[index].category.toString(),
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }

  @override
  HomePageVM create() => HomePageVM();

  @override
  void initialise(BuildContext context) {}
}
