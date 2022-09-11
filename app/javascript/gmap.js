console.log("heloo");
// Initialize and add the map
function initMap() {
  // The location of Uluru
  const uluru = { lat: -25.344, lng: 131.031 };
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 4,
    center: uluru,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: uluru,
    map: map,
  });

  // スタートボタンをマップ上に表示
  map.controls[google.maps.ControlPosition.BOTTOM].push(document.getElementById('search_box'));
}

window.initMap = initMap;