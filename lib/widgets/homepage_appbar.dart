import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    // final String data = ModalRoute.of(context)?.settings.arguments as String;

    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/cat_decoration.png',
                  ),
                  scale: 1.0)),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(color: Colors.blue, fontSize: 13.5),
          ),
        ),
        ContainerIconButton(
            iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.blueAccent),
        )),
        ContainerIconButton(
            iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.blueAccent,
          ),
        ))
      ],
    );
  }
}

class ContainerIconButton extends StatelessWidget {
  final IconButton iconButton;

  const ContainerIconButton({super.key, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(38, 0, 0, 0)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: iconButton);
  }
}
