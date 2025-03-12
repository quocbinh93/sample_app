function toggleReplyForm(commentId) {
    // Tìm form reply dựa vào comment ID
    const replyForm = document.getElementById(`reply-form-${commentId}`);
    
    if (replyForm) {
        // Ẩn tất cả các form reply khác
        document.querySelectorAll('.reply-form').forEach(form => {
            if (form !== replyForm) {
                form.style.display = 'none';
            }
        });
        
        // Toggle form hiện tại
        if (replyForm.style.display === 'none' || replyForm.style.display === '') {
            replyForm.style.display = 'block';
            // Focus vào textarea
            replyForm.querySelector('textarea').focus();
        } else {
            replyForm.style.display = 'none';
        }
    }
}

// Đảm bảo code chạy sau khi DOM đã load
document.addEventListener('turbo:load', function() {
    // Khởi tạo các event listener nếu cần
});