function openHowTo () {

  const howToTrigger = document.getElementById("how-to-trigger");
  const howToContainer = document.querySelector(".how-to-use");

  howToTrigger.addEventListener('click', () => {
    if ( howToContainer.getAttribute("style") == "display: none;") {
      howToContainer.removeAttribute("style", "display: none;");
    } else {
      howToContainer.setAttribute("style", "display: none;");
    }
  });

};
window.addEventListener("load", openHowTo);