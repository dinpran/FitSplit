import 'package:flutter/material.dart';
import 'package:fitsplit/fat_loss/advanced/advanced_warmup.dart';
import 'package:fitsplit/fat_loss/beginners/beginners_warmup.dart';
import 'package:fitsplit/fat_loss/intermediate/intermedaiate_warmup.dart';
import 'package:fitsplit/pages/home_page.dart';

class FatLossHome extends StatefulWidget {
  const FatLossHome({Key? key});

  @override
  State<FatLossHome> createState() => _FatLossHomeState();
}

class _FatLossHomeState extends State<FatLossHome> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ensure body extends behind the app bar
      appBar: AppBar(
        title: Text(
          "Fat Loss",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/fitness_image_5.jpeg',
            fit: BoxFit.cover,
          ),
          _buildCategoryCards(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Icon(Icons.home),
      ),
    );
  }

  Widget _buildCategoryCards(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: null, // Disable tap gesture for the container
        child: MouseRegion(
          onHover: (_) {
            setState(() {
              _isHovering = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovering = false;
            });
          },
          child: Container(
            color: _isHovering
                ? Colors.black.withOpacity(0.2)
                : Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCategoryCard(
                    title: 'Beginners',
                    description:
                        'Start your fitness journey with beginner workouts.(1 month)',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BeginnersWarmUp(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  _buildCategoryCard(
                    title: 'Intermediate',
                    description:
                        'Challenge yourself with inter level workouts.(1 month)',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => IntermediateWarmup(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  _buildCategoryCard(
                    title: 'Advanced',
                    description:
                        'Challenge yourself with adv level workouts.(1 month)',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AdvancedWarmup(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
