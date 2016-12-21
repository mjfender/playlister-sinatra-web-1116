module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      noslug = slug.gsub("-"," ")
      self.find_by("name like ?", noslug)#{slug.split('-').collect {|w| w.capitalize}.join(' ').gsub("With", "with").gsub("The", "the").gsub("A","a")}")
    end
  end

end