function viewConcept () {

  const conceptBtn = document.getElementById("concept-btn");
  const conceptOn = document.getElementById('concept-on');
  const conceptOff = document.getElementById("concept-off");
  const openConcept = document.getElementById("view-concept");
  const closeConcept = document.getElementById("close-concept");

  conceptBtn.addEventListener('click', () => {
    if (conceptOn.getAttribute("style") == "display: none;") {
      conceptOff.setAttribute("style", "display: none;");
      conceptOn.removeAttribute("style", "display: none;");
      openConcept.setAttribute("style", "display: none;");
      closeConcept.removeAttribute("style", "display: none;");
    } else {
      conceptOn.setAttribute("style", "display: none;")
      conceptOff.removeAttribute("style", "display: none;");
      closeConcept.setAttribute("style", "display: none;");
      openConcept.removeAttribute("style", "display: none;");
    };
  });
};
window.addEventListener('load', viewConcept);