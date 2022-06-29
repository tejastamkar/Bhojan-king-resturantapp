import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  final String image, dishname, name, review, date;
  final double rating;
  const ReviewCard(
      {Key? key,
      required this.image,
      required this.dishname,
      required this.name,
      required this.review,
      required this.date,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dishname,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                const Text(
                  "Customer : ",
                  style: TextStyle(
                      color: Color.fromRGBO(171, 171, 171, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              '"$review"',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            )
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RatingBarIndicator(
              rating: rating,
              itemCount: 5,
              itemSize: 15,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(30, 26, 26, 0.6)),
            ),
          ],
        ),
      ],
    );
  }
}
