function userMenu () {
  const userBtn = document.getElementById("user-menu-btn");
  const leftList = document.getElementById("header-left-off");
  const rightList = document.getElementById("header-right-on");
  const userMenus = document.querySelectorAll(".user-menu-none");

  userBtn.addEventListener('click', () => {
    if (rightList.getAttribute("class") == "header-right-contents") {
      leftList.setAttribute("class", "user-menu-none");
      rightList.removeAttribute("class", "header-right-contents");
      rightList.setAttribute("class", "user-menu-on");
      userMenus.forEach(function(menu) {
        menu.removeAttribute("class", "user-menu-none");
        menu.setAttribute("class", "user-menu-items-on");
      });
    } else {
      leftList.removeAttribute("class", "user-menu-none");
      leftList.setAttribute("class", "header-left-contents")
      rightList.removeAttribute("class", "user-menu-on");
      rightList.setAttribute("class", "header-right-contents");
      userMenus.forEach(function(menu) {
        menu.removeAttribute("class", "user-menu-items-on");
        menu.setAttribute("class", "user-menu-none");
      });
    };
  });
};
window.addEventListener('load', userMenu);