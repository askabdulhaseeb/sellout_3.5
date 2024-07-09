import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../attachment_selection/selectable_attachment/domain/picked_attachment.dart';
import '../../../../../review/domain/entities/review_entity.dart';
import '../../providers/add_listing_form_provider.dart';

class AddListingPickedAttachmentTile extends StatelessWidget {
  const AddListingPickedAttachmentTile({required this.attachment, super.key});
  final PickedAttachment attachment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: AspectRatio(
        aspectRatio: 4 / 4,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: attachment.type == AttachmentType.image
                  ? Image.asset(
                      attachment.file.path,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Center(child: Text('Video')),
                    ),
            ),
            // Remove button
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () =>
                    Provider.of<AddListingFormProvider>(context, listen: false)
                        .removeAttachment(attachment),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
