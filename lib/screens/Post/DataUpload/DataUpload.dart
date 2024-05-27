import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class DataUpload extends StatefulWidget {
  const DataUpload({super.key});

  @override
  State<DataUpload> createState() => _DataUploadState();
}

class _DataUploadState extends State<DataUpload> {
  List<AssetEntity> _mediaList = [];

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      print("Permission granted");
      // Proceed with accessing the storage
    } else if (status.isDenied) {
      print("Permission denied");
      // Handle the case when permission is denied
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); // Open app settings for the user to change permission
    }
  }

  Future<void> _loadPhotos() async {
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );
    List<AssetEntity> media = [];
    for (var album in albums) {
      final recentMedia = await album.getAssetListPaged(page: 0, size: 100);
      media.addAll(recentMedia);
    }

    setState(() {
      _mediaList = media;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Upload'),
      ),
      body: _mediaList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: _mediaList.length,
        itemBuilder: (context, index) {
          return FutureBuilder<Uint8List?>(
            future: _mediaList[index].thumbnailData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return Image.memory(snapshot.data!, fit: BoxFit.cover);
            },
          );
        },
      ),
    );
  }
}
