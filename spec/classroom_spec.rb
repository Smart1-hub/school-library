require './classroom'
require './student'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Grade 12'
    @student = Student.new 'Grade 12', 20, 'Roland'
  end

  it 'should returns a Classroom object' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'should show the classroom label' do
    expect(@classroom.label).to eq 'Grade 12'
  end

  it 'should show the classroom label' do
    expect(@classroom.students.length).to eq 0
  end

  it 'should show the classroom label' do
    @classroom.add_student @student
    expect(@classroom.students.length).to eq 2
  end
end
