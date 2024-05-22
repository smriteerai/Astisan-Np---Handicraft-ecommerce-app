import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final String reviewerName;
  final String reviewText;
  final double rating;

  const ReviewWidget({
    Key? key,
    required this.reviewerName,
    required this.reviewText,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reviewerName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: index < rating ? Colors.amber : Colors.grey,
                size: 20,
              );
            }),
          ),
          Text(reviewText),
        ],
      ),
    );
  }
}
