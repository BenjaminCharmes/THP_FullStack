arnToTranslate = prompt("Quel morceau d'ARN souhaite-tu traduire en protéines ?")

arnToTranslate = arnToTranslate.match(/.{3}/g);

console.log("Voici le morceau d'ARN que tu souhaite traduire: ");
console.log(arnToTranslate);
console.log("")

arnToTranslate.forEach((element, index) => {
  if(element === "UCU" || element === "UCC" || element === "UCA" || element === "UCG" || element === "AGU" || element === "AGC"){
    arnToTranslate[index] = "Sérine"
  }
  if(element === "CCU" || element === "CCC" || element === "CCA" || element === "CCG"){
    arnToTranslate[index] = "Proline"
  }
  if(element === "UUA" || element === "UUG"){
    arnToTranslate[index] = "Leucine"
  } 
  if(element === "UUU" || element === "UUC"){
    arnToTranslate[index] = "Phénylalanine"
  } 
  if(element === "CGU" || element === "CGC" || element === "CGA" || element === "CGG" || element === "AGA" || element === "AGG"){
    arnToTranslate[index] = "Arginine"
  } 
  if(element === "UAU" || element === "UAC"){
    arnToTranslate[index] = "Tyrosine"
  } 
});

console.log("Voici la séquence de protéines correspondante: ");
console.log(arnToTranslate)

