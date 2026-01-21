const toggle = document.getElementById("nav-toggle");
const nav = document.querySelector(".nav-list");
const overlay = document.querySelector(".nav-overlay");

nav.addEventListener("click", (e) => {
  if (e.target.tagName === "A") toggle.checked = false;
});

overlay.addEventListener("click", () => {
  toggle.checked = false;
});

document.addEventListener("keydown", (e) => {
  if (!toggle.checked || e.key !== "Tab") return;

  const focusable = nav.querySelectorAll("a");
  const first = focusable[0];
  const last = focusable[focusable.length - 1];

  if (e.shiftKey && document.activeElement === first) {
    e.preventDefault();
    last.focus();
  } else if (!e.shiftKey && document.activeElement === last) {
    e.preventDefault();
    first.focus();
  }
});

