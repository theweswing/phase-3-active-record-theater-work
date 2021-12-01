class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions = self.auditions
    actors = auditions.collect { |given| given[:actor] }
    actors
  end

  def locations
    auditions = self.auditions
    locations = auditions.collect { |given| given[:location] }
  end

  def lead
    auditions = self.auditions
    hired_actors = auditions.select { |given| given[:hired] == true }
    if hired_actors.length == 0
      'No actor has been hired for this role'
    else
      hired_actors[0]
    end
  end

  def understudy
    auditions = self.auditions
    hired_actors = auditions.select { |given| given[:hired] == true }
    if hired_actors.length <= 1
      'No actor has been hired for understudy for this role'
    else
      hired_actors[1]
    end
  end
end
