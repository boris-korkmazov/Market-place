FactoryGirl.define do
  factory :lesson do
    title "MyString"
    description "MyText"
    video { Rack::Test::UploadedFile.new "#{Rails.root}/spec/test_data/video.mp4"}
    likes 0
  end

end
