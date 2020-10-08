function slideImage () {

  const imageFirst = document.querySelector(".slide-image");
  const imageSecond = document.querySelector('.slide-image-second');
  const imageThird = document.querySelector(".slide-image-third");

  imageFirst.addEventListener("animationend", () => {
    imageFirst.setAttribute("style", "display: none;");
    imageThird.removeAttribute("style", "display: none;");

    imageSecond.addEventListener("animationend", () => {
      imageSecond.setAttribute("style", "display: none;");
    });

    imageThird.addEventListener("animationend", () => {
       imageThird.setAttribute("style", "display: none;");
       imageFirst.removeAttribute("style", "display: none;");
       imageSecond.removeAttribute("style", "display: none;");
    });

  });
};
window.addEventListener("load", slideImage);