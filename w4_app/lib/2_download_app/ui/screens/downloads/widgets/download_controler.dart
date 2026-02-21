import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size; // in MB

  Ressource({required this.name, required this.size});
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  double _progress = 0.0; // 0.0 → 1.0

  // GETTERS
  DownloadStatus get status => _status;
  double get progress => _progress;

  // ACTIONS
  void startDownload() async {
    if (_status == DownloadStatus.downloading ||
        _status == DownloadStatus.downloaded)
      return;

    _status = DownloadStatus.downloading;
    notifyListeners();

    for (int i = 0; i <= 10; i++) {
      _progress = i * 10;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 1000));
    }

    _status = DownloadStatus.downloaded;
    notifyListeners();
  }
}
