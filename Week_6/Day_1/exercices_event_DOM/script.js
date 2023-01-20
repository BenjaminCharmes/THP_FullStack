// Fonctionnalité 1️⃣ & 1️⃣-bis

let footer = document.getElementsByTagName("footer")[0];
let n = 1

footer.addEventListener("click", function footerClicker(){ 
  console.log(`Clic numéro ${n} !`);
  n++;
});

// Fonctionnalité 2️⃣

let navbarHeader = document.getElementById("navbarHeader");
let hamburgerMenu = document.getElementsByClassName("navbar-toggler")[0];

hamburgerMenu.addEventListener("click", function navbarCollapser(){ 
  navbarHeader.classList.toggle("collapse");
});

// Fonctionnalité 3️⃣

let cardOne = document.getElementsByClassName("card")[0];
let editBtnOne = cardOne.getElementsByClassName("btn-outline-secondary")[0];

editBtnOne.addEventListener("click", function cardOneTextRed(){ 
  cardOne.style = "color: red";
});

// Fonctionnalité 4️⃣

let cardTwo = document.getElementsByClassName("card")[1];
let editBtnTwo = document.getElementsByClassName("btn-outline-secondary")[1];

editBtnTwo.addEventListener("click", function cardTwoTextBlackOrGreen(){ 
  if (cardTwo.style.color === "green"){
    cardTwo.style.color = "";
  } else if (cardTwo.style.color === ""){
    cardTwo.style.color = "green";
  }
});

// Fonctionnalité 5️⃣

let header = document.getElementsByTagName("header")[0];
let cdnBootstrap = document.getElementsByTagName("link")[0];

// header.addEventListener("dblclick", functionboostrapDisabler(){ 
//   if (cdnBootstrap.href == "") {
//     cdnBootstrap.href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css";
//   } else if (cdnBootstrap.href == 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css') {
//     cdnBootstrap.removeAttribute('href');
//   }
// });

header.addEventListener("dblclick", function boostrapDisabler(){ 
  if (cdnBootstrap.disabled == false) {
    cdnBootstrap.disabled = true;
  } else if (cdnBootstrap.disabled == true) {
    cdnBootstrap.disabled = false;
  }
});

// Fonctionnalité 6️⃣

let btnView = document.querySelectorAll(".btn-success");
let cardText = document.querySelectorAll(".card-text");
let cardImg = document.querySelectorAll(".card-img-top");

btnView.forEach ((element, index) => {
  let cardView = false;
  btnView[index].addEventListener("mouseover", function reduceCard(){ 
    if (cardView == false) {
      cardImg[index].style.width = "20%";
      cardText[index].style.display = "none";
      cardView = true;
    } else {
      cardImg[index].style.width = "100%";
      cardText[index].style.display = "block";
      cardView = false;
    }
  });
}) 

// Fonctionnalité 7️⃣

let btnNext = document.querySelector(".btn-secondary");
let row = document.querySelectorAll(".row")[1];

btnNext.addEventListener("click", function moveUp(){
  let lastCol = row.lastElementChild;
  lastCol.remove();
  row.insertBefore(lastCol, row.firstElementChild);
});

// Fonctionnalité 8️⃣

let btnPreview = document.querySelector(".btn-primary");

btnPreview.addEventListener("click", function moveDown(e){
  e.preventDefault();
  let firstCol = row.firstElementChild;
  firstCol.remove();
  row.insertBefore(firstCol, row.lastElementChild.nextSibling);
});

// Fonctionnalité 9️⃣

let logo = document.getElementsByTagName('strong')[0];
let body = document.getElementsByTagName('body')[0];

logo.addEventListener('mouseover', function selected(){
  body.addEventListener("keypress", (e) => {   
    if (e.key === "a") {
      body.removeAttribute('class')
      body.classList.add('d-flex');
      body.classList.add('flex-column');
      body.classList.add('col-4');
    } else if (e.key === "y") {
      body.removeAttribute('class')
      body.classList.add('d-flex');
      body.classList.add('flex-column');
      body.classList.add('col-4');
      body.classList.add('m-auto');
    } else if (e.key == "p") {
      body.removeAttribute('class')
      body.classList.add('d-flex');
      body.classList.add('flex-column');
      body.classList.add('col-4');
      body.classList.add('ml-auto');
    } else if(e.key === "b") {
      body.removeAttribute('class');
    }
  })
});

// Fonctionnalité 🤫

let pattern = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
let current = 0;

document.addEventListener('keydown', function keyHandler(event){
  if (pattern.indexOf(event.key) < 0 || event.key !== pattern[current]) {
		current = 0;
		return;
	}
  current++;
  if (pattern.length === current) {
		current = 0;
		window.alert('Congratulations! You Found an Easter Egg!');
    window.open("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
	}
}, false);