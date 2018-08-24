require 'spec_helper.rb'

describe Solver do
  before :each do
    @people = [[2, 'matayo'], [1, 'nico'], [0, 'angelo'], [3, 'luca']]

    @logins = { # ugly on purpose
      0 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
      1 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
      2 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
      3 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
    }

    @solver = Solver.new @people, @logins
  end

  it "solver should be an instance of Solver class." do
    expect(@solver).to be_a Solver
  end

  it "sum of values of each hash should be equal the length of the logins' arrays" do
    answer = @solver.solve.solution
    answer.each do |k, v|
      expect(v.values.sum).to eq(@logins[k].count)
    end
  end
end
