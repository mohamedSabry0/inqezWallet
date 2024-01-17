document.addEventListener('turbo:load', function () {
  const toggleButton = document.getElementById('toggleButton');
  const sidebar = document.getElementById('sidebar');
  const mainContent = document.getElementById('mainContent');

  toggleButton.addEventListener('click', function () {
    if (sidebar.style.left === '-30%' || sidebar.style.left === '') {
      sidebar.style.left = '0';
      mainContent.style.right = '-30%';
    } else {
      sidebar.style.left = '-30%';
      mainContent.style.right = '0';
    }
  });

  mainContent.addEventListener('click', function () {
    if (sidebar.style.left === '0') {
      sidebar.style.left = '-30%';
      mainContent.style.right = '0';
    }
  });
});
