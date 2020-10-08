function userMenu () {
  const userBtn = document.getElementById("user-menu-btn");
  const leftCategory = document.getElementById("header-left-category");
  const leftUser = document.getElementById("header-left-user");
  const parentBtn = document.getElementById("menu-btn");

  userBtn.addEventListener('click', () => {
    if (leftUser.getAttribute("style") == "display: none;") {
      leftCategory.setAttribute("style", "display: none;");
      leftUser.removeAttribute("style", "display: none;");
      parentBtn.setAttribute("class", "open-menu");
    } else {
      leftUser.setAttribute("style", "display: none;");
      leftCategory.removeAttribute("style", "display: none;");
      parentBtn.removeAttribute("class", "open-menu");
    };
  });
};
window.addEventListener('load', userMenu);