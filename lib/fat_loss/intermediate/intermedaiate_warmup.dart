import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/intermediate/intermediate_warmup_jumping_jacks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';

class IntermediateWarmup extends StatefulWidget {
  const IntermediateWarmup({super.key});

  @override
  State<IntermediateWarmup> createState() => _IntermediateWarmupState();
}

class _IntermediateWarmupState extends State<IntermediateWarmup> {
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
                    builder: (context) => IntermediateWarmupJumpingJacks(),
                  ),
                );
              },
              child: Icon(Icons.start),
            )
          ],
        ),
      ),
    );
    ;
  }
}
