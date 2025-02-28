ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"

# Sử dụng minitest-reporters để hiển thị kết quả test rõ ràng hơn
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

class ActiveSupport::TestCase
  # Chạy test song song với số worker tương ứng với số CPU
  parallelize(workers: :number_of_processors)

  # Load tất cả fixture trong thư mục test/fixtures/*.yml
  fixtures :all

  # Thêm các helper method dùng chung cho tất cả các test ở đây...
end
