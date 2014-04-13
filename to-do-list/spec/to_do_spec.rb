require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'should initialize the Task with a description' do
    new_task = Task.new('wash the car', '02/23/12', '1')
    new_task.should be_an_instance_of Task
  end

  it 'lets you read the description' do
    new_task = Task.new('wash the car','02/23/12', '1')
    new_task.description.should eq 'wash the car'
  end

  it 'lets you complete a task' do
    new_task = Task.new('walk the dog', '02/23/12', '1')
    new_task.completed.should eq true
  end

  it 'adds a due task to the task' do
    new_task = Task.new('walk the dog', '02/23/12', '1')
    new_task.due_date.should eq '02/23/12'
  end

  it 'adds a due task to the task' do
    new_task = Task.new('walk the dog', '02/23/12', '1')
    new_task.priority.should eq '1'
  end
end

describe List do
  it 'should initialize with a list title' do
    new_list = List.new('Chores')
    new_list.should be_an_instance_of List
  end

  it 'should add a task to the instance list' do
    new_list = List.new('Chores')
    new_task = Task.new('wash the car', '02/23/12', '1')
    new_list.add_task(new_task)
    new_list.tasks.should eq [new_task]
  end

  it 'should sort the instances by priority' do
    new_list = List.new('Chores')
    new_task2 = Task.new('wash the car', '02/23/12', '4')
    new_task1 = Task.new('walk the dog', '02/23/12', '1')
    new_task3 = Task.new('walk the dog', '02/23/12', '3')
    new_list.add_task(new_task1)
    new_list.add_task(new_task2)
    new_list.add_task(new_task3)
    new_list.priority_sort.should eq [new_task2, new_task3, new_task1]
  end

  it 'should sort the instances by due date' do
    new_list = List.new('Chores')
    new_task1 = Task.new('wash the car', '02/12/14', '4')
    new_task2 = Task.new('walk the dog', '02/23/14', '1')
    new_task3 = Task.new('grocery store', '02/03/14', '3')
    new_list.add_task(new_task1)
    new_list.add_task(new_task2)
    new_list.add_task(new_task3)
    new_list.due_date_sort.should eq [new_task3, new_task1, new_task2]
  end
end
