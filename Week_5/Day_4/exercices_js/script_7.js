while (true) {
  let answer = prompt("Hummm .. ? 😒")
  if (answer.slice(-1) == "?") {
    alert("Ouais Ouais...");
  } else if (answer.length > 0 && answer == answer.toUpperCase()) {
    alert("Pwa, calme-toi...");
  } else if (answer.toUpperCase().includes("FORTNITE")) {
    alert("On s' fait une partie soum-soum ?");
  } else if (answer == "") {
    alert("T'es en PLS ?");
  } else if (answer == "quit") {
    break;
  } else {
    alert("Balek.");
  }
  console.log(typeof answer)
}
