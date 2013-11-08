require 'spec_helper'

describe Student do
  
	let(:user) { FactoryGirl.create(:user) }
	before { @student = user.students.build(name: "Sample Student", student_id: "1234567890") }

	subject { @student }

	it { should respond_to(:name) }
	it { should respond_to(:student_id) }
	it { should respond_to(:user_id) }
	
	it { should respond_to(:user) }
	its(:user) { should eq user}

	it { should be_valid }

  	describe "when user_id is not present" do
    	before { @student.user_id = nil }
    	it { should_not be_valid }
  	end

  	describe "when name is not present" do
  		before { @student.name = " " }
  		it { should_not be_valid }
  	end

  	describe "when student_id is not present" do
  		before { @student.student_id = " " }
  		it { should_not be_valid }
  	end

  	describe "when student_id is already taken" do
  		before do
  			student_with_same_id = @student.dup
  			student_with_same_id.student_id = @student.student_id
  			student_with_same_id.save
  		end

  		it { should_not be_valid }
  	end

end
