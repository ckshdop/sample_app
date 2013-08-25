class User < ActiveRecord::Base
	before_save {self.email= email.downcase}
	before_save {self.session_token ||= Digest::SHA1.hexdigest(
		SecureRandom.urlsafe_base64.to_s)}
	has_secure_password
#讓email會自動去驗證格式是否正確
	validates :email, format: { with:/\A[^@]+@[^@]+\z/}, uniqueness: {case_sensitive:false}
#讓name必填，字最多30
	validates :name, presence:true, length: {maximum:30}


end
