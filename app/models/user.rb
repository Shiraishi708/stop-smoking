class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :stop_smoking_info
  # 禁煙日数を全て足したメソッド
  def add_all_days_stop_smoking
    infos = self.stop_smoking_info
    stop_smoking_dates = 0
    infos.each do |info|
      if info.fail_flag == false
        stop_smoking_dates += (Time.zone.now.to_date - info.created_at.to_date).numerator
      else
        stop_smoking_dates += (info.fail_datetime.to_date - info.created_at.to_date).numerator
      end
    end
    return stop_smoking_dates
  end
  
  #貯まったお金
  def money_caliculation
    add_all_days_stop_smoking * 450
  end
  
  #伸びた寿命
  def extended_lifespan
    add_all_days_stop_smoking * 110
  end
  
  #禁煙日数
  def not_smokng_days
    add_all_days_stop_smoking
  end
end
