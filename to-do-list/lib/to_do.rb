class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end
end

class List
  @tasks = []

  def initialize(title)
    @title = title
  end

  def add_task(task)
    self.tasks <<
  end

end

