import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/loader.dart';
import '../domain/pickable_attachment_option.dart';
import '../providers/picked_media_provider.dart';
import '../view/picked_media_display_limits_widget.dart';
import '../view/picked_media_display_tile.dart';

class PickableAttachmentScreen extends StatefulWidget {
  PickableAttachmentScreen({PickableAttachmentOption? option, super.key})
      : option = option ?? PickableAttachmentOption();
  final PickableAttachmentOption option;

  static const String routeName = '/selectable-attachment';

  @override
  State<PickableAttachmentScreen> createState() =>
      _PickableAttachmentScreenState();
}

class _PickableAttachmentScreenState extends State<PickableAttachmentScreen> {
  // Prompt
  // In Flutter, I want to display the whole gallary in a screen like whatsapp,
  // from where user can pick media, but i also don't want to crash the
  // application as there are alot of photos in the gallary,
  // how can i display that images, videos, document, audio or any type of
  // media file from local storage

  final int _pageSize = 60;
  final List<AssetEntity> _mediaList = <AssetEntity>[];
  bool _isLoading = true;
  int _currentPage = 0;
  int _lastPage = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<PickedMediaProvider>(context, listen: false)
        .setOption(widget.option);
    _requestPermissionAndLoad();
  }

  Future<void> _requestPermissionAndLoad() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      log('Permission granted');
      _loadMoreMedia();
    } else {
      // TODO: Handle permission denied
      log('Permission denied');
      // Handle permission denied
    }
  }

  Future<void> _loadMoreMedia() async {
    if (_currentPage == _lastPage && !_isLoading) return;
    RequestType type = widget.option.type.requestType;
    log('Selected type: $type');
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: type,
      filterOption: FilterOptionGroup(
        imageOption: const FilterOption(
          sizeConstraint: SizeConstraint(
            minWidth: 100,
            minHeight: 100,
          ),
        ),
        videoOption: FilterOption(
          sizeConstraint: const SizeConstraint(
            minWidth: 100,
            minHeight: 100,
          ),
          durationConstraint:
              DurationConstraint(max: widget.option.maxVideoDuration),
        ),
        orders: <OrderOption>[
          const OrderOption(type: OrderOptionType.createDate, asc: false),
        ],
      ),
    );
    log('Step 2 - Load more media');
    try {
      final List<AssetEntity> media = await albums[0]
          .getAssetListPaged(page: _currentPage, size: _pageSize);
      final int totalImages = await albums[0].assetCountAsync;
      _mediaList.addAll(media);
      _currentPage++;
      _lastPage = (totalImages / _pageSize).ceil();
    } catch (e) {
      log('❌ Error - PickableAttachmentScreen:_loadMoreMedia  $e');
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const PickedMediaDisplayLimitsWidget(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async =>
                await Provider.of<PickedMediaProvider>(context, listen: false)
                    .onSubmit(context),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: Loader())
          : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!_isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadMoreMedia();
                }
                return false;
              },
              child: _mediaList.isEmpty
                  ? const Center(child: Text('Not Found'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: _mediaList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final AssetEntity media = _mediaList[index];
                        return PickedMediaDisplayTile(media: media);
                      },
                    ),
            ),
    );
  }
}
