import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;

  const MenuItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.blue[700],
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 48,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          onTap: () => {Navigator.pushNamed(context, route)},
        ),
      ),
    );
  }
}
