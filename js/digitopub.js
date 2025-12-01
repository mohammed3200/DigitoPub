/**
 * plugins/themes/DigitoPub/js/digitopub.js
 *
 * Vanilla JS for navigation toggle and other client-side features.
 */

document.addEventListener("DOMContentLoaded", () => {
  const toggler = document.querySelector(".navbar-toggler");
  const navList = document.querySelector(".digitopub_nav_list");

  if (toggler && navList) {
    toggler.addEventListener("click", () => {
      // Toggle the 'active' class on the list to show/hide it
      navList.classList.toggle("active");

      // Update aria-expanded status
      const isExpanded = navList.classList.contains("active");
      toggler.setAttribute("aria-expanded", isExpanded);
    });
  }

  // Add a simple scroll-to-top handler if needed
  // const scrollToTop = document.createElement('div');
  // scrollToTop.classList.add('scroll-to-top');
  // document.body.appendChild(scrollToTop);

  // window.addEventListener('scroll', () => {
  //     if (window.scrollY > 200) {
  //         scrollToTop.style.display = 'block';
  //     } else {
  //         scrollToTop.style.display = 'none';
  //     }
  // });

  // scrollToTop.addEventListener('click', () => {
  //     window.scrollTo({ top: 0, behavior: 'smooth' });
  // });
});
