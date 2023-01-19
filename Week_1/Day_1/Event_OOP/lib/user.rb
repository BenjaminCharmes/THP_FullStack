class User
  attr_accessor :email, :age
  @@all_users = Array.new

  def initialize(email_to_save, age_to_save) 
    @email = email_to_save
    @age = age_to_save 
    @@all_users = @@all_users.push(self)
    # @@all_users << self
  end

  def self.all # Give an array with every user
    return @@all_users
    # Don't need return in Ruby
  end

  def self.find_by_email(email_to_find) # Find an user with his email
    @@all_users.each do |user|
      if user.email == email_to_find
        return user
      end
    end
    puts "No user with this email."
  end

end