class Post < ApplicationRecord

validates :base_url, presence: true
before_create :generate_short_url

LETTERS = ([*('a'..'z'),*('0'..'9')])

def generate_short_url
 new_url = Array.new(6) { LETTERS.sample }.join
 self.short_url= new_url
end

end
