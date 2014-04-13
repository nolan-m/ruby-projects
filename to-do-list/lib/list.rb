class List
  def initialize(title)
    @title = title
    @tasks = []
  end

  def title
    @title
  end

  def add_task(task)
    @tasks << task
  end

  def tasks
    @tasks
  end

  def priority_sort
    @tasks.sort_by {|obj| obj.priority}.reverse
  end

  def due_date_sort
   @tasks.sort_by {|obj| obj.due_date}
  end


end
