import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../review/domain/entities/review_entity.dart';
import '../../providers/add_listing_form_provider.dart';

class AddListingAttachmentSelectionButton extends StatelessWidget {
  const AddListingAttachmentSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        button(
            icon: Icons.photo_outlined,
            text: 'Add Photos',
            onPressed: () async => await Provider.of<AddListingFormProvider>(
                        context,
                        listen: false)
                    .setImages(
                  context,
                  type: AttachmentType.image,
                )),
        const SizedBox(width: 16),
        button(
            icon: Icons.videocam_outlined,
            text: 'Add Videos',
            onPressed: () async => await Provider.of<AddListingFormProvider>(
                        context,
                        listen: false)
                    .setImages(
                  context,
                  type: AttachmentType.video,
                )),
      ],
    );
  }

  Widget button({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    final BorderRadius radius = BorderRadius.circular(8);
    return Expanded(
      child: Opacity(
        opacity: 0.8,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: radius,
          ),
          child: Material(
            borderRadius: radius,
            child: InkWell(
              onTap: onPressed,
              borderRadius: radius,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon),
                    const SizedBox(height: 8),
                    Text(
                      text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
