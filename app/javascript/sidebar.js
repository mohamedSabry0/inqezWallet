document.addEventListener('DOMContentLoaded', function () {
  const toggleButton = document.getElementById('toggleButton');
  const sidebar = document.getElementById('sidebar');
  const mainContent = document.getElementById('mainContent');
  console.log(toggleButton);

  toggleButton.addEventListener('click', function () {
    if (sidebar.style.width === '0px' || sidebar.style.width === '') {
      sidebar.style.width = '30%';
      mainContent.style.marginLeft = '30%';
    } else {
      sidebar.style.width = '0';
      mainContent.style.marginLeft = '0';
    }
  });
});
