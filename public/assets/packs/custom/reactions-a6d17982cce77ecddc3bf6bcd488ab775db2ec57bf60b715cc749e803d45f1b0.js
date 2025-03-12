document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.reaction-btn').forEach(button => {
    button.addEventListener('click', (e) => {
      if (!button.classList.contains('active')) {
        button.classList.add('active');
        const countSpan = button.querySelector('.count');
        countSpan.textContent = parseInt(countSpan.textContent) + 1;
      }
    });
  });
});

document.addEventListener('ajax:success', function(event) {
  const [data, status, xhr] = event.detail;
  // Cập nhật số lượng reactions mà không reload trang
  // Logic cập nhật UI sẽ được xử lý ở đây
});
