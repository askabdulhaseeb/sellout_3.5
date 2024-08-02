import 'dart:convert';
import 'dart:developer';

import '../../../../../core/enums/core/api_request_type.dart';
import '../../../../../core/sources/apis/api_call.dart';
import '../../../../../core/sources/apis/data_state.dart';
import '../../../../../core/sources/local/core/local_request_history.dart';
import '../../../../../core/sources/local/local_listing.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../models/listing_model.dart';

class ListingAPI {
  Future<List<ListingEntity>> listing() async {
    final String url = '${AppStrings().baseURL}/category';
    try {
      ApiRequestEntity? request = await LocalRequestHistory()
          .request(url, duration: const Duration(days: 1));
      if (request != null) {
        final List<ListingEntity> local = LocalListing().listings;
        if (local.isNotEmpty) {
          return local;
        }
      }
      final DataState<bool> req = await ApiCall<bool>().call(
        url: url,
        requestType: ApiRequestType.get,
        isAuth: false,
        isConnectType: false,
      );

      if (req is DataSuccess) {
        final List<dynamic> data = json.decode(req.data ?? '');
        return await _decodeData(data);
      } else if (req is DataFailer) {
        log('❌ Error ListingAPI: DataFailer -> ${req.exception?.message}');
        // Local Hive
        return await _localData(url);
      } else {
        return await _localData(url);
      }
    } catch (e) {
      log('❌ Error ListingAPI: catch -> $e');
      return await _localData(url);
    }
  }

  Future<List<ListingEntity>> _localData(String url) async {
    List<ListingEntity> local = LocalListing().listings;
    if (local.isNotEmpty) {
      return local;
    } else {
      // Local Request History
      ApiRequestEntity? request = await LocalRequestHistory().request(url);
      if (request != null) {
        final List<dynamic> data = json.decode(request.encodedData);
        return await _decodeData(data);
      } else {
        return <ListingEntity>[];
      }
    }
  }

  Future<List<ListingEntity>> _decodeData(List<dynamic> data) async {
    List<ListingEntity> listings = <ListingEntity>[];
    for (final Map<String, dynamic> item in data) {
      final ListingEntity entity = ListingModel.fromJson(item);
      listings.add(entity);
      await LocalListing().save(entity);
    }
    return listings;
  }
}
