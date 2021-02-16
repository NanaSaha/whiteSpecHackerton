class User < ApplicationRecord
    validates :username,  allow_blank: false,:presence => { message: "Please enter the surname"}
    validates :email,  allow_blank: false,:presence => { message: "Please enter email"}


    def self.create_user(username, email)
       user = User.new({:username => username, :email => email })
    end
end
