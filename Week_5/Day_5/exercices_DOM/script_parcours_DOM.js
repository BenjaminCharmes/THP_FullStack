console.log("1️⃣")
console.log(`Combien y a-t-il d'éléments <p> présents dans la page HTML ? `)
let pNumber = document.getElementsByTagName("p")
console.log(`Il y a ${pNumber.length} éléments <p>.`)

console.log("");
console.log("--------------------");
console.log("");

console.log("2️⃣")
console.log(`Quel est le contenu texte de l'élément portant l'id coucou ?`)
let idCoucou = document.getElementById("coucou")
console.log(`Le contenu de l'élément portant l'id coucou est: ${idCoucou.textContent}`)

console.log("");
console.log("--------------------");
console.log("");

console.log("3️⃣")
console.log(`Quelle est l'URL vers laquelle pointe le 3ème élément <a> de la page HTML ?`)
let a = document.getElementsByTagName("a")
console.log(`L'URL de la 3ème balise <a> est: ${a[2].href}`)

console.log("");
console.log("--------------------");
console.log("");

console.log("4️⃣")
console.log(`Combien d'éléments portent la classe compte-moi ?`)
let classCompteMoi = document.getElementsByClassName("compte-moi")
console.log(`Il y a ${classCompteMoi.length} éléments avec la classe compte-moi.`)

console.log("");
console.log("--------------------");
console.log("");

console.log("5️⃣")
console.log(`Combien d'éléments <li> portent la classe compte-moi ? `)
let liClassCompteMoi = document.querySelectorAll("li.compte-moi")
console.log(`Il y a ${liClassCompteMoi.length} éléments <li> avec la classe compte-moi.`)

console.log("");
console.log("--------------------");
console.log("");

console.log("6️⃣")
console.log(`Combien d'éléments <li> et situés dans une liste ordonnée portent la classe compte-moi ?`)
let olTagliClassCompteMoi = document.querySelectorAll("ol > li.compte-moi")
console.log(`Il y a ${olTagliClassCompteMoi.length} éléments <li> avec la classe compte-moi dans un élément <ol>.`)

console.log("");
console.log("--------------------");
console.log("");

console.log("7️⃣")
console.log(`Quel est le conteu caché dans le premier <li> du second <ul> ?`)
let jeuDePiste = document.getElementsByTagName("ul")[6].getElementsByTagName("li")
console.log(`Le contenu caché visuellement de l'utilisateur est: ${jeuDePiste[0].textContent + ". " + jeuDePiste[1].textContent}`)
