import '../../../../../core/enums/core/api_request_type.dart';
import '../../../../../core/sources/apis/api_call.dart';
import '../../../../../core/sources/apis/data_state.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../param/add_listing_param.dart';

class AddListingApi {
  Future<bool> addItem(AddListingParam param) async {
    try {
      final String url = '${AppStrings().baseURL}/post/create';
      // Add item to the server
      final DataState<bool> result = await ApiCall<bool>().callFormData(
        url: url,
        requestType: ApiRequestType.post,
        fielsMap: param.itemBody(),
        attachments: param.attachments,
        isAuth: true,
        isConnectType: false,
      );
      if (result is DataFailer) {
        return false;
      } else {
        print('Success');
        return true;
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
}
