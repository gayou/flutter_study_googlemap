// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http; //httpリクエスト用

import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用

import 'page.dart';

class MapUiPage extends Page {
  MapUiPage() : super(const Icon(Icons.map), 'Full map');

  @override
  Widget build(BuildContext context) {
    return const MapUiBody();
  }
}

class MapUiBody extends StatefulWidget {
  const MapUiBody();

  @override
  State<StatefulWidget> createState() => MapUiBodyState();
}

class MapUiBodyState extends State<MapUiBody> {
  MapUiBodyState();

  GoogleMapController mapController;
  CameraPosition _position;
  bool _isMoving = false;
  bool _compassEnabled = true;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  MapType _mapType = MapType.normal;
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomGesturesEnabled = true;
  bool _myLocationEnabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _position = const CameraPosition(
      target: LatLng(33.58915638493726, 130.40335946829225),
      zoom: 15.0,
    );

    final GoogleMap googleMap = GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: _position,
      trackCameraPosition: true,
      compassEnabled: _compassEnabled,
      cameraTargetBounds: _cameraTargetBounds,
      minMaxZoomPreference: _minMaxZoomPreference,
      mapType: _mapType,
      rotateGesturesEnabled: _rotateGesturesEnabled,
      scrollGesturesEnabled: _scrollGesturesEnabled,
      tiltGesturesEnabled: _tiltGesturesEnabled,
      zoomGesturesEnabled: _zoomGesturesEnabled,
      myLocationEnabled: _myLocationEnabled,
    );


    return new Container(
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      child: SizedBox(
        child: googleMap,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      mapController.addListener(_onMapChanged);
    });

    controller.addMarker(MarkerOptions(
      position: LatLng(
          33.58915638493726,
          130.40335946829225),
      infoWindowText: const InfoWindowText('An interesting location', '*'),
    ));

    controller.addMarker(MarkerOptions(
      position: LatLng(
          33.58915638693726,
          130.40335948829225),
      infoWindowText: const InfoWindowText('An interesting location', '*'),
    ));
  }

  void _extractMapInfo() {
    _position = mapController.cameraPosition;
    _isMoving = mapController.isCameraMoving;
  }

  void _onMapChanged() async {
//    debugPrint("_onMapChanged");

//    debugPrint(mapController.isCameraMoving.toString());
    //マップスクロールが止まったら、APIに現在位置を送る
    if (!_isMoving) {
      //APIにリクエストを送信
//      await getData();
      //マーカーをセット

      //マーカーを取得
//      var markers = mapController.markers;
//      debugPrint("markers------");
//      debugPrint(markers.toString());
//      markers.forEach((Marker marker) {
//        LatLng position = marker.options.position;
//        debugPrint("Latitude:" + position.latitude.toString() + " / Longitude:" + position.longitude.toString());
//      });

      //GoogleMapの表示位置取得
      var target = mapController.cameraPosition.target;
      var longitude = target.longitude;
      var latitude = target.latitude;
      debugPrint("longitude:" + longitude.toString() + " latitude:" + latitude.toString());

//      var bounds = mapController.options.cameraTargetBounds.bounds;
//      debugPrint(bounds.toString());
//    var northeast = bounds.northeast.toString();
//    var southwest = bounds.southwest.toString();
//
//    debugPrint("northeast:" + northeast);
//    debugPrint("southwest:" + southwest);
    }

    setState(() {
      _extractMapInfo();
    });
  }

  //APIリクエスト
  Future getData() async{ //Future xxx async{} という記法
    _position = mapController.cameraPosition;
    var target = mapController.cameraPosition.target;
    var longitude = target.longitude;
    var latitude = target.latitude;
//    var bounds = mapController.options.cameraTargetBounds.bounds;
//    mapController.cameraPosition.
//      var northeast = bounds.northeast.toString();
//      var southwest = bounds.southwest.toString();
//
//      debugPrint("northeast:" + northeast);
//      debugPrint("southwest:" + southwest);

//    http.Response response = await http.get("http://geo.gayou.info/search/ajax?longitude=130.39872444047546&latitude=33.58841469192037&northeast=33.59230687482208,130.40093994512176&southwest=33.584522333419905,130.39650893582916");
//    debugPrint(response.body);

    debugPrint("call getData()");

//    return response;
  }
}