function pulldown() {
console.log("yes")
const bars = document.getElementById("fa-bars")
bars.addEventListener("click", ()=>{
  console.log("hello");
  const pulldown = document.getElementById("header-pulldown")
  pulldown.classList.toggle("click");
})
}

window.addEventListener("DOMContentLoaded",pulldown)