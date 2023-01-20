answer = prompt("De quel nombre veux-tu calculer la factorielle ?");

function fact(number)
{
  if (number === 0)
  {
    return 1;
  }
  return number * fact(number-1);
}

console.log(`La factorielle de ${answer} est: ${fact(answer)}`);