import 'package:flutter/material.dart';
import 'package:goose_flutter_assignment/Providers/authentication_handler.dart';
import 'package:goose_flutter_assignment/constants.dart';
import 'package:provider/provider.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(context
                  .read<AuthenticationHandler>()
                  .userAccount
                  ?.photoUrl ??
              "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png"),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          onPressed: () {},
          icon: const Icon(Icons.edit),
          style: ElevatedButton.styleFrom(
            backgroundColor: UIColors.primaryColor,
            foregroundColor: UIColors.primaryColor,
          ),
        )
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  const CustomListTile(
      {Key? key,
      required this.title,
      this.subtitle,
      this.actions,
      required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget titleRow = Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
    dynamic action;
    if (subtitle != null) {
      titleRow = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleRow,
          const SizedBox(height: 10.0),
          Text(subtitle!, style: const TextStyle(color: Colors.white))
        ],
      );
    }

    if (actions != null) {
      if (actions!.length > 1) {
        action = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: actions!,
        );
      } else {
        action = actions!.elementAt(0);
      }
    } else {
      action = const SizedBox.square();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0).copyWith(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: icon.color?.withOpacity(0.06),
            radius: 25,
            child: icon,
          ),
          const SizedBox(width: 20),
          Expanded(child: titleRow),
          action,
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar();

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentPage = 4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: UIColors.primaryColor,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.white,
            currentIndex: currentPage,
            onTap: (value) => setState(() {
              currentPage = value;
            }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Discover'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Items'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Services'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: UIColors.backgroundColor,
                offset: Offset(0, 3),
              )
            ],
            color: UIColors.secondaryColor
                .withRed(UIColors.secondaryColor.red + 20)
                .withBlue(UIColors.secondaryColor.blue + 20)
                .withGreen(UIColors.secondaryColor.green + 20),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: UIColors.secondaryColor,
            onPressed: () {
              setState(() {
                currentPage = 2;
                Navigator.of(context).pushNamed('sell_item_page');
              });
            },
          ),
        ),
      ],
    );
  }
}
