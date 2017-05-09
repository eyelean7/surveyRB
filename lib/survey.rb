class Survey < ActiveRecord::Base
  has_many(:questions)
  validates :name, presence: true

  before_save :make_title

  private
    def make_title
      title = self.name.split(/ |\_|\-/).map(&:capitalize).join(" ")
      self.name = title
    #   words=self.name.split()
    #   title = []
    #   words.each() do |word|
    #     title.push(word.capitalize())
    #   end
    #   self.name = title.join(" ")
    end

end
