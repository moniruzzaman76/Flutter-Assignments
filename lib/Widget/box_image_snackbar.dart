import 'package:flutter/material.dart';

class ImageBoxSnackBar extends StatelessWidget {
  final String imageUrl;
  const ImageBoxSnackBar({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38
                  ),
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Clicked on photo!'),
                      ),
                    );
                  },
                  child: const Text("Caption",style: TextStyle(
                    fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5
                  ),),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}