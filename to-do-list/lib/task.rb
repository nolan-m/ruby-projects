class Task
  def initialize(description, due_date, priority)
    @description = description
    @due_date = due_date
    @priority = priority
  end

  def description
    @description
  end

  def completed
    @completed = true
  end

  def due_date
    @due_date
  end

  def priority
    @priority
  end

end

