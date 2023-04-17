import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Providers/write_review_provider.dart';

class RatingDialog {
  static Future<void> show(BuildContext context) async {
    double _rating = 0.0;
    final _reviewController = TextEditingController();

    Future<void> _launchURL() async {
      String url = 'https://play.google.com/store/apps/details?id=com.whatsapp';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rate My App'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('How would you rate this app?'),
              const SizedBox(height: 16),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // Provider.of<WriteReviewProvider>(context,listen: false).postReviewSubmit(widget.reviewModel.id,context);

                  _rating = rating;
                },
              ),
              // const SizedBox(height: 16),
              // TextField(
              //   controller: _reviewController,
              //   decoration: InputDecoration(
              //     hintText: 'Write a review',
              //     border: OutlineInputBorder(),
              //   ),
              //   onSubmitted: (review) {
              //     Provider.of<WriteReviewProvider>(context,listen: false).postReviewSubmit(widget.reviewModel.id,context);
              //
              //     print('Review successfully submitted: $review');
              //   },
              // ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () async {
                await _launchURL();
                Navigator.pop(context);
              },
              child: const Text('SUBMIT'),
            ),
          ],
        );
      },
    );
  }
}
