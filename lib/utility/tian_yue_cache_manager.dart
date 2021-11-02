// HINT: Unnecessary import. Future and Stream are available via dart:core.
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file/src/interface/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/src/web/web_helper.dart';
import 'package:flutter_cache_manager/src/cache_store.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

///Flutter Cache Manager
///Copyright (c) 2019 Rene Floor
///Released under MIT License.

class TianYueCacheManager extends BaseCacheManager {
  static const key = "libCachedImageData";

  static late TianYueCacheManager _instance;
  final String _cacheKey = '';
  Duration _maxAgeCacheObject = Duration.zero;
  int _maxNrOfCacheObjects = 0;

  /// This path is used as base folder for all cached files.
  /// The DefaultCacheManager that can be easily used directly. The code of
  /// this implementation can be used as inspiration for more complex cache
  /// managers.
  factory TianYueCacheManager() {
    if (_instance == null) {
      _instance = new TianYueCacheManager._();
    }
    return _instance;
  }

  TianYueCacheManager._() : super();

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<FileInfo> downloadFile(String url, {String? key, Map<String, String>? authHeaders, bool force = false}) {
    // TODO: implement downloadFile
    throw UnimplementedError();
  }

  @override
  Future<void> emptyCache() {
    // TODO: implement emptyCache
    throw UnimplementedError();
  }

  @override
  Stream<FileInfo> getFile(String url, {String key = '', Map<String, String>? headers}) {
    // TODO: implement getFile
    throw UnimplementedError();
  }

  @override
  Future<FileInfo?> getFileFromCache(String key, {bool ignoreMemCache = false}) {
    // TODO: implement getFileFromCache
    throw UnimplementedError();
  }

  @override
  Future<FileInfo?> getFileFromMemory(String key) {
    // TODO: implement getFileFromMemory
    throw UnimplementedError();
  }

  @override
  Stream<FileResponse> getFileStream(String url, {String? key, Map<String, String>? headers, bool withProgress = false}) {
    // TODO: implement getFileStream
    throw UnimplementedError();
  }

  @override
  Future<File> getSingleFile(String url, {String key = '', Map<String, String>? headers}) {
    // TODO: implement getSingleFile
    throw UnimplementedError();
  }

  @override
  Future<File> putFile(String url, Uint8List fileBytes, {String? key, String? eTag, Duration maxAge = const Duration(days: 30), String fileExtension = 'file'}) {
    // TODO: implement putFile
    throw UnimplementedError();
  }

  @override
  Future<File> putFileStream(String url, Stream<List<int>> source, {String? key, String? eTag, Duration maxAge = const Duration(days: 30), String fileExtension = 'file'}) {
    // TODO: implement putFileStream
    throw UnimplementedError();
  }

  @override
  Future<void> removeFile(String key) {
    // TODO: implement removeFile
    throw UnimplementedError();
  }
}
