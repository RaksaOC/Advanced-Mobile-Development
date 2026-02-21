import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  Icon _getProgressIcon() {
    switch (controller.status) {
      case DownloadStatus.downloading:
        return Icon(Icons.hourglass_top, color: Colors.grey[400]);
      case DownloadStatus.downloaded:
        return Icon(Icons.download_done, color: Colors.green[400]);
      case DownloadStatus.notDownloaded:
        return Icon(Icons.download, color: Colors.grey[400]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) => ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: Icon(Icons.file_present),
        title: Text(controller.ressource.name),
        subtitle: Text(
          '${controller.progress} % completed - ${controller.ressource.size} MB',
          style: TextStyle(color: Colors.blue),
        ),
        trailing: IconButton(
          onPressed: controller.startDownload,
          icon: _getProgressIcon(),
        ),
      ),
    );
  }
}
