import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key, required this.message}) : super(key: key);
  final message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //color: Color.fromARGB(255, 91, 57, 160),
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
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 4,
                child: Text(
                  "08:12",
                  style: TextStyle(color: Colors.grey[400], fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
