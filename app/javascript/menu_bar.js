function openMenu () {

  const menuBtn = document.getElementById("category-pull");
  const menuBar = document.getElementById('category-bar-none');
  const menuBarOn = document.getElementById("category-bar-on");

  menuBtn.addEventListener('mouseover', function () {
       menuBar.removeAttribute("class", "category-bar-none");
  });

  menuBarOn.addEventListener("mouseleave", function () {
    menuBar.setAttribute("class", "category-bar-none");
  })
};
window.addEventListener("load", openMenu);