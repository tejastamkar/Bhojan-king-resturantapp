import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String name;
  final Widget icons;
  final Function func;
  const MenuButton(
      {Key? key, required this.icons, required this.name, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => func()),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: icons),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
