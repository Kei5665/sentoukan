// カードの上下運動
let checkUp = document.getElementById('up')
let checkDown = document.getElementById('down')
let card = document.getElementById('card')

function cardUp() {
  card.classList.add("up")
  checkUp.classList.add("disable")
  card.classList.remove("down")
  checkDown.classList.remove("disable")
}
function cardDown() {
  card.classList.add("down")
  checkDown.classList.add("disable")
  card.classList.remove("up")
  checkUp.classList.remove("disable")
}
checkUp.addEventListener("click", cardUp);
checkDown.addEventListener("click", cardDown);