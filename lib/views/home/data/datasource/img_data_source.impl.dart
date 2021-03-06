import 'dart:convert';

import 'package:wallpix/core/core.e.dart';
import 'package:wallpix/views/home/data/datasource/imgs_data_source.c.dart';
import 'package:wallpix/views/home/data/models/img.model.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';
import 'package:http/http.dart' as http;

class ImgDataSourceImpl implements ImgDataSource {
  final http.Client httpClient;

  ImgDataSourceImpl({
    required this.httpClient,
  });

  @override
  Future<List<ImgEntity>> getCuratedImg({required int page}) async {
    return _getImgsFromDataSource(page: page);
  }


  @override
  Future<List<ImgEntity>> searchImg({required String query, required int page}) async {
    return _getImgsFromDataSource(
      page: page,
      query: query,
    );
  }

  Future<List<ImgEntity>> _getImgsFromDataSource({
    required int page,
    String? query,
  }) async {
    final uri = Uri.parse(
      query == null
          ? 'https://api.unsplash.com/photos?page=$page&client_id=$kAccessKey&per_page=70'
          : 'https://api.unsplash.com/search/photos?page=1&client_id=$kAccessKey&per_page=70&query=$query',
    );
    final response = await httpClient.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedResponse = jsonDecode(response.body);

      final List<dynamic> results =
          query != null ? decodedResponse["results"] : decodedResponse;
      final List<ImgEntity> images = [];
      for (int i = 0; i < results.length; i++) {
        images.add(ImgModel.fromJson(results[i]));
      }
      return images;
    } else {
      throw ServerFailure();
    }
  }
}
