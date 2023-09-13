import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  String name;
  String email;
  String imageUrl;
  AccountCard(
      {super.key,
      required this.email,
      this.imageUrl = 'Assets/account.png',
      required this.name});

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 2,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: CircleAvatar(
                radius: 50,
                child: Image.asset(
                  widget.imageUrl,
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(children: [
            Text(
              widget.name,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(widget.email)
          ])),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
