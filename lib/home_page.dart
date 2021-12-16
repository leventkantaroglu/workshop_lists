import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, String>> contacts = [
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "cellNumber": "05463434115",
    },
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "name": "Hakan",
      "cellNumber": "05463434115",
    },
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "name": "Hakan",
      "cellNumber": "05463434115",
    },
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "name": "Hakan",
      "cellNumber": "05463434115",
    },
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "name": "Hakan",
      "cellNumber": "05463434115",
    },
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "name": "Hakan",
      "cellNumber": "05463434115",
    },
    {
      "name": "Levent",
      "cellNumber": "05663434110",
    },
    {
      "name": "Hakan",
      "cellNumber": "05463434115",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  splashColor: Colors.pink,
                  onTap: () {
                    if (index == 0) {
                      showAboutDialog(context: context);
                    } else {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return const SimpleDialog(
                            children: [
                              Card(
                                child: Text("Kapanış"),
                              )
                            ],
                          );
                        },
                      ).then((_) {
                        //...
                      });
                    }
                  },
                  child: GridTile(
                    child: Center(
                      child: Text(contacts[index]["name"] ?? ""),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  ListView seperatedListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return (index % 2 == 1)
            ? const Divider(color: Colors.red)
            : const SizedBox();
      },
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return contactItemWidget(
          contacts[index]["name"]!,
          contacts[index]["cellNumber"]!,
        );
      },
    );
  }

  Widget contactItemWidget(String name, String phoneNumber) {
    return ListTile(
      leading: const Icon(Icons.circle),
      title: Text(name),
      subtitle: Text(phoneNumber),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {},
    );
  }
}
