import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/riwayat_model.dart';

class RiwayatController {
  final String UrlAPI = 'http://10.0.2.2:8000/api';
  /// fungsi menampilkan riwayat orderan user
  Future<List<RiwayatModel>> getRiwayat(String token, String email) async {
    final response = await http.get(Uri.parse('$UrlAPI/riwayat/$email'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<RiwayatModel> riwayat = [];
      for (var datas in data['data']) {
        RiwayatModel riwayatModel = RiwayatModel.fromMap(datas);
        riwayat.add(riwayatModel);
      }
      return riwayat;
    } else {
      throw Exception('Gagal mengambil data riwayat');
    }
  }
  /// fungsi untuk menampilkan riwayat orderan admin
  Future<List<RiwayatModel>> getRiwayatAdmin(String token) async {
    final response = await http.get(Uri.parse('$UrlAPI/riwayat'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<RiwayatModel> riwayat = [];
      for (var datas in data['data']) {
        RiwayatModel riwayatModel = RiwayatModel.fromMap(datas);
        riwayat.add(riwayatModel);
      }
      return riwayat;
    } else {
      throw Exception('Gagal mengambil data riwayat');
    }
  }
  /// menampilkan riwayar orderan masuk
  Future<List<RiwayatModel>> getIncoming(String token) async {
    final response = await http.get(Uri.parse('$UrlAPI/incoming'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<RiwayatModel> riwayat = [];
      for (var datas in data['data']) {
        RiwayatModel riwayatModel = RiwayatModel.fromMap(datas);
        riwayat.add(riwayatModel);
      }
      return riwayat;
    } else {
      throw Exception('Gagal mengambil data riwayat');
    }
  }
  /// menampilkan riwayat penjualan hari ini
  Future<List<RiwayatModel>> getSales(String token) async {
    final response = await http.get(Uri.parse('$UrlAPI/riwayat/done'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<RiwayatModel> riwayat = [];
      print("coba aja " + data['data'].length.toString());
      for (var datas in data['data']) {
        RiwayatModel riwayatModel = RiwayatModel.fromMap(datas);
        riwayat.add(riwayatModel);
      }
      return riwayat;
    } else {
      throw Exception('Gagal mengambil data riwayat');
    }
  }
  /// fungsi untuk menampilkan total orderan yang telah diselesaikan
  Future<String?> getItemSales(String token) async {
    final response = await http.get(Uri.parse('$UrlAPI/riwayat/itemsales'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'].toString();
    } else {
      throw Exception('Gagal mengambil data riwayat');
    }
  }
  /// fungsi untuk menampilkan total penjualan hari ini 
  Future<String?> getTotalSales(String token) async {
    final response = await http.get(Uri.parse('$UrlAPI/riwayat/total'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'].toString();
    } else {
      throw Exception('Gagal mengambil data riwayat');
    }
  }
}
