// 1️⃣
function changeTitles() {
  document.getElementsByClassName("jumbotron-heading")[0].innerHTML = "Ce que j'ai appris à THP";
  document.getElementsByClassName("lead text-muted")[0].innerHTML = "THP est une formation qui, en 3 mois, à plein temps, vous apportera des connaissances actionnables pour vous permettre de voir plus loin. Chez nous, pas de professeurs, pas de locaux, mais un groupe de travail en présentiel. Après 11 semaines, les principaux langages et outils du web n'auront plus de secret pour vous !";
}

changeTitles();

// 2️⃣
function changeCallToActions(){
  document.getElementsByClassName("btn btn-primary my-2")[0].innerHTML = "OK je veux tester !";
  document.getElementsByClassName("btn btn-primary my-2")[0].href = "http://www.thehackingproject.org";
  document.getElementsByClassName("btn btn-secondary my-2")[0].innerHTML = "Non Merci";
  document.getElementsByClassName("btn btn-secondary my-2")[0].href = "https://www.pole-emploi.fr/accueil/";
}

changeCallToActions();

// 3️⃣
function changeLogoName(){
  document.getElementsByClassName("navbar-brand")[0].innerHTML = "The THP Experience";
  document.getElementsByClassName("navbar-brand")[0].style.fontSize = "2em";
}

changeLogoName()

// 4️⃣
let imagesArray = ["https://img.icons8.com/color/480/000000/html-5.png", "https://img.icons8.com/color/480/000000/css3.png", "https://img.icons8.com/color/480/000000/javascript.png", "https://img.icons8.com/color/480/000000/ruby-programming-language.png", "https://img.icons8.com/color/480/000000/bootstrap.png", "https://img.icons8.com/color/480/000000/github.png", "https://i.imgur.com/bJE9Pka.png", "https://avatars2.githubusercontent.com/u/25484553?s=200&v=4", "https://img.icons8.com/color/480/000000/heroku.png"];
let cardImgArray = document.getElementsByClassName("card-img-top")

function populateImages(){
  for(let index = 0; index < cardImgArray.length; index++) {
    cardImgArray[index].src = imagesArray[index];
  }
}

populateImages()

// 5️⃣
let cardArray = document.getElementsByClassName("col-md-4")
function deleteLastCards(){
  for(let index = 0; index < 3; index++) {
    cardArray[cardArray.length - 1].remove();
  }
}

deleteLastCards()

// 6️⃣
let cardTextArray = document.getElementsByClassName("card-text")
let cardTextToModif = ["L’HyperText Markup Language, généralement abrégé HTML, est le langage de balisage conçu pour représenter les pages web", "Les feuilles de style en cascade, généralement appelées CSS de l'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML", "JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives mais aussi pour les serveurs. C'est un langage orienté objet à prototype."]
function changeCardsText(){
  for(let index = 0; index < 3; index++) {
    cardTextArray[index].innerHTML = cardTextToModif[index]
  }
}

changeCardsText()

// 7️⃣
function changeViewButtons() {
  for(let index = 0; index < cardArray.length; index++) {
    cardArray[index].getElementsByTagName("button")[0].classList = "btn btn-success"
  }
}

changeViewButtons()

// 8️⃣
function pyramid() {
  let div = document.createElement("div");
  div.className = "row";
  let element = document.getElementsByClassName("row")[1]
  element.after(div)
  let jsCard = document.getElementsByClassName("col-md-4")[2];
  div.appendChild(jsCard);
}

pyramid()