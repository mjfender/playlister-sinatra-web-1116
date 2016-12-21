module Sluggifiable
  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = self.unslug(slug) 
      self.find_by(name: name)
    end

    def unslug(slug)
      slug.split("-").map{|word| word.capitalize}.join(" ")
    end
  end
end
