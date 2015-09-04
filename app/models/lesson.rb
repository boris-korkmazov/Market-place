class Lesson < ActiveRecord::Base

  belongs_to :user

  validates :title, :description, :video, presence: true

  mount_uploader :video, VideoUploader

  validate :check_video_ext, if: 'video?'


  def check_video_ext
    if not %w[.mp4 .ogv].include? File.extname(self.video.path).downcase
      errors.add :video, I18n.t('errors.messages.extension_white_list_error')
    end
  end

end
