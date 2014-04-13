require './lib/task'
require './lib/list'

@list = []
@completed = []

def main_menu
  puts 'Press "n" to add a new list.'
  puts 'Press "l" to view all of your lists.'
  puts 'Press "a" to add a new task.'
  # puts 'Press "r" to remove a task.'
  puts 'Press "x" to exit.'

  main_choice = gets.chomp

  if main_choice == 'n'
    add_list
  elsif main_choice == 'a'
    add_task
  elsif main_choice == 'l'
   show_lists
  elsif main_choice == 'x'
    puts "Good-Bye!"
  elsif main_choice == 'r'
    remove_task
  else
    puts "Sorry, that wasn't a valid option."
    puts "\n"
    main_menu
  end
end

def add_list
  puts "Enter a description of the new list:"
  user_description = gets.chomp
  new_list = List.new(user_description)
  @list << new_list
  puts "List added.\n"
  puts "\n"
  main_menu
end

def show_lists
  if @list.empty?
    puts "Nothing in list.  Create a list."
  else
    puts "Here are all your lists:"
    @list.each_with_index do |list, index|
      puts "#{index + 1}. #{list.title}"    ##description is the method
    end
    select_list
  end
  puts "\n"
  puts 'Press "d" to sort a list by due date or "p" to sort by priority.'
  user_input = gets.chomp
  if user_input == 'd'
    due_date_sort
  elsif user_input == 'p'
    priority_sort
  else
  main_menu
  end
end

def select_list
  puts "Select a list to see your tasks"
  user_input = gets.chomp
  user_input = (user_input.to_i) - 1
  puts "Your tasks:"
  @list[user_input].tasks.each_with_index do |task, index|
    puts "#{index + 1}.  #{task.description} --DO BY: #{task.due_date} --PRIORITY: #{task.priority}"
  end
end

def add_task
  puts "Select a list to add a task. \n"
  @list.each_with_index do |list, index|
    puts "#{index + 1}. #{list.title}"    ##description is the method
  end
  user_input = gets.chomp
  user_input = (user_input.to_i) - 1
  puts "You selected: #{@list[user_input].title}"
  puts "Enter a description of the new task:"
  user_description = gets.chomp

  user_date = due_date_input

  user_priority = priority_input

  task_to_add = Task.new(user_description, user_date, user_priority)
  @list[user_input].add_task(task_to_add)

  puts "Task added.\n"
  puts "\n"
  main_menu
end

def due_date_input
  puts "Enter a due date. (MM/DD/YY)"
  user_date = gets.chomp
  if /(\d\d)\D(\d\d)\D(\d\d)/ =~ user_date
    user_date
  else
    puts "Invalid date."
    due_date_input
  end
end

def priority_input
  puts "What is the priority from 1 to 5?"
  user_priority = gets.chomp
  if user_priority.length == 1 && /[1-5]{1}/ =~ user_priority
    user_priority
  else
    puts "Invalid priority."
    priority_input
  end
end

def list_tasks
  if @list.empty? && @completed.empty?
    puts "Nothing in list"
  else
    puts "Here are your current tasks:"
    @list.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description} --DO BY: #{task.due_date} --PRIORITY: #{task.priority}"    ##description is the method
    end
    puts "Completed Tasks:"
    @completed.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description}"    ##description is the method
    end
  end
  puts "\n"
  main_menu
end

def priority_sort
  puts "Pick a list to sort by priority."
  @list.each_with_index do |list, index|
    puts "#{index + 1}. #{list.title}"    ##description is the method
  end
  user_input = gets.chomp
  user_input = (user_input.to_i) - 1
  @list[user_input].priority_sort
  @list[user_input].tasks.each_with_index do |task, index|
    puts "#{index + 1}.  #{task.description} --DO BY: #{task.due_date} --PRIORITY: #{task.priority}"
  end
  main_menu
end

def due_date_sort
  puts "Pick a list to sort by due date."
  @list.each_with_index do |list, index|
    puts "#{index + 1}. #{list.title}"    ##description is the method
  end
  user_input = gets.chomp
  user_input = (user_input.to_i) - 1
  @list[user_input].due_date_sort
  @list[user_input].tasks.each_with_index do |task, index|
    puts "#{index + 1}.  #{task.description} --DO BY: #{task.due_date} --PRIORITY: #{task.priority}"
  end
  main_menu
end


def remove_task
  if @list.empty?
    puts "Nothing in list"
  else
    puts "Type the number to mark as completed"
    @list.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description} --DO BY: #{task.due_date} --PRIORITY: #{task.priority}"    ##description is the method
    end
    user_input = gets.chomp
    user_input = (user_input.to_i) - 1
    @completed << @list[user_input]
    @list[user_input].completed
    @list.delete_at(user_input)
    puts "Task completed"
  end
  puts "\n"
  main_menu
end


main_menu
