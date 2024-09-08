import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_warmup_jumping_jacks.dart';
import 'package:fitsplit/full_body/beginners/beginners_rest.dart';

class AdvancedWarmup extends StatefulWidget {
  const AdvancedWarmup({super.key});

  @override
  State<AdvancedWarmup> createState() => _AdvancedWarmupState();
}

class _AdvancedWarmupState extends State<AdvancedWarmup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WARMUP"),
        automaticallyImplyLeading: false,
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
                    builder: (context) => AdvancedWarmupJumpingJacks(),
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
