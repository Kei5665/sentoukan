function initMap() {

  let lat = gon.latitude;
  let lng = gon.longitude;
  let shopMarker = [];
  let infoWindow = [];
  // 現在地が設定されてない時はフォームに初期位置をセットしておく
  document.getElementById('lat').value = lat;
  document.getElementById('lng').value = lng;

  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13,
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

  // 円の描写
  circle = new google.maps.Circle({
    center: new google.maps.LatLng(lat, lng),
    map: map,
    radius: 2000,
    clickable: false,
    fillColor: '#297EDD',
    fillOpacity: 0.1,
    strokeColor: '#297EDD',
    strokeOpacity: 0.6,
    strokeWeight: 0.7,
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
          // サークルを更新
          updateCircle(pos.lat, pos.lng, map);
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

  // もし検索ヒットしたら
  if (gon.shops) {

    for (let i = 0; i < gon.shops.length; i++) {

      // 検索結果のサウナの座標取得
      markerLatLng = new google.maps.LatLng({
        lat: parseFloat(gon.shops[i]['latitude']),
        lng: parseFloat(gon.shops[i]['longitude'])
      });
      // マーカーの作成
      shopMarker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map,
        animation: google.maps.Animation.DROP
      });
      // 情報ウィンドウには投稿情報モーダルへのリンクを入れる
      infoWindow[i] = new google.maps.InfoWindow({
        content: '<div class="card shadow-none">'+'<div class="card-body">'+'<h3>Material Tailwind</h3>'+'<p class="mb-3 opacity-60">The time is now.</p>'+'<form action="/quests" accept-charset="UTF-8" method="post"><input value='+gon.shops[i]['id']+' type="hidden" name="q[shop_id]"><input value='+lat+' type="hidden" name="q[latitude]"><input value='+lng+' type="hidden" name="q[longitude]"><input type="submit" name="commit" value="ここに行く" class="button button-pink text-lg font-bold" data-disable-with="ここへ行く"></form>'+'</div>'+'</div>'
      });
      // マーカークリックで情報ウィンドウを表示
      shopMarker[i].addListener('click', function() {
        infoWindow[i].open(map, shopMarker[i]);
      });
    }
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

updateCircle = (lat, lng, map) => {
  circle.setMap(null);
  circle = null;
  circle = new google.maps.Circle({
    center: new google.maps.LatLng(lat, lng),
    map: map,
    radius: 2000,
    clickable: false,
    fillColor: '#297EDD',
    fillOpacity: 0.1,
    strokeColor: '#297EDD',
    strokeOpacity: 0.6,
    strokeWeight: 0.7,
  });
}

// フラッシュの削除
function closeFlash(){
  let closeFlashBtn = document.getElementById('flash')
  closeFlashBtn.remove()
}