const books = [
  { title: 'Gatsby le magnifique', id: 133712, rented: 39 },
  { title: 'A la recherche du temps,perdu', id: 237634, rented: 28 },
  { title: 'Orgueil & Préjugés', id: 873495, rented: 67 },
  { title: 'Les frères Karamazov', id: 450911, rented: 55 },
  { title: 'Dans les forêts de Sibérie', id: 8376365, rented: 15 },
  { title: 'Pourquoi j\'ai mangé mon père', id: 450911, rented: 45 },
  { title: 'Et on tuera tous les affreux', id: 67565, rented: 36 },
  { title: 'Le meilleur des mondes', id: 88847, rented: 58 },
  { title: 'La disparition', id: 364445, rented: 33 },
  { title: 'La lune seule le sait', id: 63541, rented: 43 },
  { title: 'Voyage au centre de la Terre', id: 4656388, rented: 38 },
  { title: 'Guerre et Paix', id: 748147, rented: 19 }
  ];

// 1️⃣
console.log(`Est-ce que tous les livres ont été au moins empruntés une fois ?`)
let booksRented = 0
books.forEach(books => {
  if (books.rented < 1)
  {
    booksRented++
  }
});
if (booksRented === 0)
{
  console.log("Oui !");
} else {
  console.log("Non !");
}
console.log("");
console.log("--------------------");
console.log("");


// 2️⃣
console.log(`Quel est livre le plus emprunté ?`)
function compare( a, b ) {
  if ( a.rented > b.rented ){
    return -1;
  }
  if ( a.rented < b.rented ){
    return 1;
  }
  return 0;
}

console.log("Le livre le plus emprunté : " + books.sort( compare )[0].title);
console.log("");
console.log("--------------------");
console.log("");

// 3️⃣
console.log(`Quel est le livre le moins emprunté ?`)
function compareBis( a, b ) {
  if ( a.rented < b.rented ){
    return -1;
  }
  if ( a.rented > b.rented ){
    return 1;
  }
  return 0;
}

console.log("Le livre le moins emprunté : " + books.sort( compareBis )[0].title);
console.log("");
console.log("--------------------");
console.log("");

// 4️⃣
console.log(`Le livre avec l'ID 873495 est:`)
console.log(books.find(books => {
  return books.id === 873495
}).title)
console.log("");
console.log("--------------------");
console.log("");


// 5️⃣
console.log(`Supprime le livre avec l'ID: 133712`)
for (var i = books.length - 1; i >= 0; --i) {
  if (books[i].id == 133712) {
      books.splice(i,1);
  }
}
console.log(books);
console.log("");
console.log("--------------------");
console.log("");

// 6️⃣
console.log(`Les livres par ordre alphabétique:`)

function compareBisBis( a, b ) {
  if ( a.title < b.title ){
    return -1;
  }
  if ( a.title > b.title ){
    return 1;
  }
  return 0;
}

console.log(books.sort( compareBisBis ));

