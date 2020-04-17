import 'package:flutter/material.dart';

class AvailableStatus extends StatelessWidget {
  final status;
  final dueDate;

  AvailableStatus({this.status, this.dueDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: status
          ? Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              child: Text(
                'Available',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              child: Text(
                dueDate != null ? 'Due: $dueDate' : 'Due: not available',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
