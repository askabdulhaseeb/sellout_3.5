import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/enums/core/attachment_type.dart';
import '../../../../../attachment_selection/selectable_attachment/domain/picked_attachment.dart';
import '../../providers/add_listing_form_provider.dart';
import 'add_listing_attachment_selction_button.dart';
import 'add_listing_picked_attachment_tile.dart';

class AddListingAttachmentSelectionWidget extends StatelessWidget {
  const AddListingAttachmentSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
        builder: (BuildContext context, AddListingFormProvider formPro, _) {
      final List<PickedAttachment> attachments = formPro.attachments;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const AddListingAttachmentSelectionButton(),
          attachments.isEmpty
              ? InkWell(
                  onTap: () =>
                      formPro.setImages(context, type: AttachmentType.image),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'No item selected yet',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            'Photos: ${formPro.attachments.length}/${formPro.listingType?.noOdPhotos}, Videos: 0/1 Choose your main photo and add a video to best showcase the item that you are selling. Your video may be prioritized to buyers.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : AspectRatio(
                  aspectRatio: 16 / 8,
                  child: ListView.builder(
                    itemCount: attachments.length,
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        AddListingPickedAttachmentTile(
                            attachment: attachments[index]),
                  ),
                ),
        ],
      );
    });
  }
}
