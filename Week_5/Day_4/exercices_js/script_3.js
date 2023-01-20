answer = prompt("Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?");

answer = Number(answer)

var pyramide = [];

console.log(`Voici ta pyramide a ${answer} étage(s).`)
console.log("")

for(let i = 1; i <= answer; i++)
{
  pyramide.push("#");

  console.log(pyramide.join(""));
}