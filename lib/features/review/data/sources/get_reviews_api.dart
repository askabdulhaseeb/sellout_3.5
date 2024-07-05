import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/enums/core/api_request_type.dart';
import '../../../../core/sources/apis/api_call.dart';
import '../../../../core/sources/apis/data_state.dart';
import '../../../../core/sources/local/core/local_request_history.dart';
import '../../../../core/sources/local/local_review.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../domain/entities/review_entity.dart';
import '../models/review_model.dart';

class GetReviewsApi {
  Future<DataState<List<ReviewEntity>>> getReviews({
    required String id,
    bool sellerID = false,
    bool reviewID = false,
    bool businessID = false,
    bool reviewBy = false,
  }) async {
    try {
      // API Url for getting reviews
      String url = '${AppStrings().baseURL}/review/get';
      if (sellerID) {
        url += '?seller_id=$id';
      } else if (reviewID) {
        url += '?review_id=$id';
      } else if (businessID) {
        url += '?business_id=$id';
      } else if (reviewBy) {
        url += '?review_by=$id';
      } else {
        return DataFailer<List<ReviewEntity>>(
            CustomException('Unexpected Query'));
      }
      // Old Data
      ApiRequestEntity? request = await LocalRequestHistory()
          .request(url, duration: const Duration(hours: 1));
      if (request != null) {
        final DataState<List<ReviewEntity>> local = LocalReview().reviewsState(
          id: id,
          sellerID: sellerID,
          reviewID: reviewID,
          businessID: businessID,
          reviewBy: reviewBy,
        );
        if (local is DataSuccess<List<ReviewEntity>> && local.entity != null) {
          debugPrint(
              '✅ Success in GetReviewsApi: getReviews - Old Data $local');
          return local;
        }
      }
      //
      // API Call
      final DataState<List<ReviewEntity>> responce =
          await ApiCall<List<ReviewEntity>>().call(
        url: url,
        isAuth: true,
        requestType: ApiRequestType.post,
        isConnectType: false,
        // extraHeader: <String, String>{'Content-Type': 'text/plain'},
      );
      //
      // Check responce
      // If responce is DataSuccess then decode the data and return the list of reviews
      if (responce is DataSuccess<List<ReviewEntity>>) {
        final String data = responce.data.toString();
        if (data.isNotEmpty) {
          final List<dynamic> jsonData = json.decode(data);
          final List<ReviewEntity> reviews = <ReviewEntity>[];
          for (final dynamic item in jsonData) {
            final ReviewEntity entity = ReviewModel.fromJson(item);
            await LocalReview().save(entity);
            reviews.add(entity);
          }
          debugPrint(
              '✅ Success in GetReviewsApi: getReviews - ${reviews.length}');
          return DataSuccess<List<ReviewEntity>>(data, reviews);
        } else {
          return DataFailer<List<ReviewEntity>>(
            CustomException('Failed to get reviews data is empty'),
          );
        }
      } else {
        // If responce is not DataSuccess then return the error
        return DataFailer<List<ReviewEntity>>(
          CustomException('Failed to get reviews'),
        );
      }
      // Catch the error and return the error
    } on Exception catch (e) {
      debugPrint('❌ Error Exception in GetReviewsApi: getReviews - $e');
      return DataFailer<List<ReviewEntity>>(CustomException(e.toString()));
    } on Error catch (e) {
      debugPrint('❌ Error in GetReviewsApi: getReviews - $e');
      return DataFailer<List<ReviewEntity>>(CustomException(e.toString()));
    }
  }
}
