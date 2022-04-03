import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message}) : super(key: key);
  final message;
  //final time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color.fromARGB(255, 107, 77, 166),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 60,
                  top: 10,
                  bottom: 20,
                ),
                child: Text(
                  message,
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
                      style: TextStyle(color: Colors.white38, fontSize: 13),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      color: Colors.white38,
                      size: 14,
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
