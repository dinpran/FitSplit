import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/beginners/warmup/beginners_warmup_body_squats.dart';

class BeginnersWarmUp extends StatefulWidget {
  const BeginnersWarmUp({super.key});

  @override
  State<BeginnersWarmUp> createState() => _BeginnersWarmUpState();
}

class _BeginnersWarmUpState extends State<BeginnersWarmUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WARMUP"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Get Ready For Warmup",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 155,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BeginnersWarmupBodySquats(),
                  ),
                );
              },
              child: Icon(Icons.start),
            )
          ],
        ),
      ),
    );
  }
}
