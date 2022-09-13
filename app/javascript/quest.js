function initMap() {

  let lat = gon.latitude;
  let lng = gon.longitude;

  // フォームに初期位置をセットしておく
  document.getElementById('lat').value = lat;
  document.getElementById('lng').value = lng;  

  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 14,
    center: { lat: lat, lng: lng },
    disableDefaultUI: true,
    gestureHandling: 'greedy',
    styles: [
      {
        "elementType": "labels",
        "stylers": [
          { "visibility": "off" }
        ]
      }
    ]
  });

  // 初期ピン
  pin = new google.maps.Marker({
    map: map, 
    position: new google.maps.LatLng(lat, lng),
    animation: google.maps.Animation.BOUNCE
  });

  // ボタンをマップ上に表示
  map.controls[google.maps.ControlPosition.BOTTOM].push(document.getElementById('search_box'));
  // navbarをマップ上に表示
  map.controls[google.maps.ControlPosition.TOP].push(document.getElementById('nav'));
  // 現在地へ移動ボタン
  const currentLocation = document.getElementById('position_btn');
  currentLocation.addEventListener('click', () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };
          map.setCenter(pos);
          // pinを更新
          updatePin(pos, map);
          // ポリラインの描写
          updatePolyline(pos.lat, pos.lng, gon.shop, map);
          // フォームに値を入れる
          document.getElementById('lat').value = pos.lat;
          document.getElementById('lng').value = pos.lng;
        },
        (error) => {
          var errorInfo = [
            '原因不明のエラーが発生しました',
            '位置情報の取得が許可されませんでした。設定を確認してください。',
            '電波状況などで位置情報が取得できませんでした',
            '位置情報の取得に時間がかかり過ぎてタイムアウトしました'
          ];
          var errorNum = error.code;

          var errorMessage = errorInfo[errorNum]

          alert(errorMessage);
        }
      );
    } else {
      window.alert('お使いの端末では対応しておりません...。');
    }
  });

  if (gon.shop) {
    // 検索結果の銭湯の座標取得
    markerLatLng = new google.maps.LatLng({
      lat: parseFloat(gon.shop['latitude']),
      lng: parseFloat(gon.shop['longitude'])
    });

    // マーカーの作成
    shopMarker = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      animation: google.maps.Animation.DROP
    });
    // shopMarker.addListener('click', () => {
    // });
    // ポリラインの描写
    polylineCoordinates = [
      { lat: lat, lng: lng },
      { lat: parseFloat(gon.shop['latitude']), lng: parseFloat(gon.shop['longitude'])},
    ];
    polylinePath = new google.maps.Polyline({
      path: polylineCoordinates,
      geodesic: true,
      strokeColor: "red",
      strokeOpacity: 0.5,
      strokeWeight: 8,
    });
    polylinePath.setMap(map);
  }
}
window.initMap = initMap;

updatePin = (pos, map) => {
  pin.setMap(null);
  pin = null;
  pin = new google.maps.Marker({
    position: pos,
    map: map,
    animation: google.maps.Animation.BOUNCE
  });
}

updatePolyline = (lat, lng, shop, map) => {
  polylinePath.setMap(null)
  updateCoordinates = [
    { lat: lat, lng: lng },
    { lat: parseFloat(shop['latitude']), lng: parseFloat(shop['longitude'])},
  ];
  updatePath = new google.maps.Polyline({
    path: updateCoordinates,
    geodesic: true,
    strokeColor: "red",
    strokeOpacity: 0.5,
    strokeWeight: 8,
  });
  updatePath.setMap(map);
}