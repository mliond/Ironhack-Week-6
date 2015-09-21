class Task < ActiveRecord::Base

  belongs_to :user
  
  def complete!
    self.completed = true
    self
  end


  def as_json(options={})
    super(except: [:id, :created_at, :updated_at])
  end
end