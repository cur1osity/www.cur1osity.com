module ApplicationHelper
 # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "cur1osity.com"
    if page_title.empty?  # jak nic nie bedzie to wywali tylko tutyl taki jak powyzej 
      base_title
    else
      page_title + " | " + base_title # a jak bedzie np home to do tego doda | i to co jest powyzej 
    end
  end
end