import 'package:flutter/material.dart';

class SettingItem {
  final String title;
  final String? value;

  SettingItem({required this.title, this.value});
}

class SettingSection {
  final String header;
  final List<SettingItem> items;

  SettingSection({required this.header, required this.items});
}

// ========   MAIN ============
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SettingsPage()));
}

// SETTINGS PAGE

class SettingsPage extends StatelessWidget {
  final List<SettingSection> sections = [
    SettingSection(
      header: 'My Account',
      items: [
        SettingItem(title: 'Name', value: 'Abbos Rustamov'),
        SettingItem(title: 'Username', value: 'Abbosbe'),
        SettingItem(title: 'Birthday', value: 'August 2, 1991'),
        SettingItem(title: 'Mobile Number', value: '+998841234556'),
        SettingItem(title: 'Email'),
        SettingItem(title: 'Password'),
      ],
    ),

    SettingSection(
      header: 'App Settings',
      items: [
        SettingItem(title: 'Appearance', value: 'Light'),
        SettingItem(title: 'Accessibility'),
        SettingItem(title: 'Language', value: 'English, USA'),
        SettingItem(title: 'Text & Images'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_left, color: Colors.black, size: 28),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, sectionIndex) {
          return buildSection(sections[sectionIndex]);
        },
      ),
    );
  }
}

Widget buildSection(SettingSection section) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Section header = my account
      Container(
        width: double.infinity,
        color: Color(0xFFF2F2F7),
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 8),
        child: Text(
          section.header,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: .5,
          ),
        ),
      ),

      // itemlar - oq background
      Container(
        color: Colors.white,
        child: Column(
          children: section.items.asMap().entries.map((entry) {
            int index = entry.key;
            SettingItem item = entry.value;
            bool isLast = index == section.items.length - 1;
            return buildItem(item, isLast: isLast);
          }).toList(),
        ),
      ),
    ],
  );
}

Widget buildItem(SettingItem item, {bool isLast = false}) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),

              if (item.value != null)
                Text(
                  item.value!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              SizedBox(width: 6),

              // Icon
              Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
            ],
          ),
        ),

        if (!isLast)
          Divider(
            height: 1,
            thickness: .5,
            indent: 16,
            color: Colors.grey.shade300,
          ),
      ],
    ),
  );
}
