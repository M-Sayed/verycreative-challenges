require 'pp'

def rand_time
  Time.at(rand * Time.now.to_i)
end

people = [[2, 'matayo'], [1, 'nico'], [0, 'angelo'], [3, 'luca']]

logins = { # ugly on purpose
  0 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
  1 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
  2 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
  3 => [rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time, rand_time],
}

# Write your solution below. Keep above code intact.

## Solution

class Solver
  attr_writer :logins, :people
  attr_reader :solution

  def initialize(people, logins)
    @people, @logins = people, logins
  end

  def solve
    years = extract_years
    @solution = Hash.new.tap do |answer|
      years.each do |key, value|
        answer[key] = Hash.new(0).tap do |counter|
          value.each { |a| counter[a] += 1 }
        end
      end
    end

    self # enable method chain calls.
  end

  def to_s
    @solution.map { |k, v| [@people[k][1], v] }.to_h
  end

  private

  def extract_years
    dup_logins = @logins.dup
    dup_logins.values.each(&:sort!).each { |v| v.map!(&:year) }
    dup_logins
  end
end

answer = Solver.new(people, logins).solve.to_s
p answer
