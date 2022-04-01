import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          color: Color.fromARGB(255, 91, 57, 160),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 10,
                  bottom: 20,
                ),
                child: Text(
                  "Hey",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 4,
                child: Row(
                  children: [
                    Text(
                      "08:12",
                      style: TextStyle(color: Colors.white38),
                    ),
                    Icon(
                      Icons.done_all,
                      color: Colors.white38,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
