import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../features/auth/signin/domain/entities/address_entity.dart';
import '../../../../features/listing/add_listing/domain/entities/listing_entity.dart';
import '../../../../features/listing/add_listing/domain/entities/sub_category_entity.dart';
import '../../../../features/review/domain/entities/review_entity.dart';
import '../../../enums/listing/listing_type.dart';
import '../auth/local_auth.dart';
import '../local_listing.dart';
import '../local_review.dart';
import '../local_user.dart';
import 'local_request_history.dart';
import 'local_state.dart';

class HiveDB {
  static Future<void> init() async {
    await LocalState.init();
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    await Hive.initFlutter();

    // Hive
    Hive.registerAdapter(CurrentUserEntityAdapter()); // 0
    Hive.registerAdapter(UserEntityAdapter()); // 1
    Hive.registerAdapter(ReviewEntityAdapter()); // 2
    Hive.registerAdapter(ApiRequestEntityAdapter()); // 3
    Hive.registerAdapter(AttachmentEntityAdapter()); // 4
    Hive.registerAdapter(AttachmentTypeAdapter()); // 5
    Hive.registerAdapter(AddressEntityAdapter()); // 6
    Hive.registerAdapter(ListingEntityAdapter()); // 7
    Hive.registerAdapter(SubCategoryEntityAdapter()); // 8
    Hive.registerAdapter(ListingTypeAdapter()); // 9
    // Hive box Open
    await refresh();
  }

  static Future<void> refresh() async {
    await LocalAuth().refresh();
    await LocalUser().refresh();
    await LocalRequestHistory().refresh();
    await LocalReview().refresh();
    await LocalListing().refresh();
  }

  Future<void> signout() async => await LocalAuth().signout();
}
