# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'date'

def find(id)
    candidates.find { |candidate| candidate[:id] === id }
  end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  def has_sufficient_github_points?(candidate)
    candidate[:github_points] >= 100
  end

  def known_languages?(candidate)
    candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
  end

  def applied_recently?(candidate)
    candidate[:date_applied] >= (Date.today - 15)
  end

  def over_17?(candidate)
    candidate[:age] >= 18
  end

  def qualified_candidates(candidates)
    candidates.select do |candidate|
      experienced?(candidate) &&
      has_sufficient_github_points?(candidate) &&
      known_languages?(candidate) &&
      applied_recently?(candidate) &&
      over_17?(candidate)
  end
end

  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidates| [-candidate[:years_of_experience], -candidate[:github_points]]}
  end
  
  # More methods will go below