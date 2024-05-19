const images = document.querySelectorAll("img");
images.forEach((img) => {
  img.onload = () => (img.style.opacity = 1);
  img.onerror = () => {
    img.style.opacity = 1;
    img.src = "images/placeholder.png";
    img.onload = null;
    img.onerror = null;
  };
  img.src = img.getAttribute("data-src");
});
