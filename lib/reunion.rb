# frozen_string_literal: true

class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum(&:total_cost)
  end

  def breakout
    breakout_hash = {}
    @activities.each do |activity|
      activity.owed.each do |name, amount_owed|
        if breakout_hash[name].nil?
          breakout_hash[name] = amount_owed
        else
          breakout_hash[name] += amount_owed
        end
      end
    end
    breakout_hash
  end

  def summary
    summary = []
    breakout.each do |name, amount_owed|
      summary << "#{name}: #{amount_owed}\n"
    end
    summary.join[0..-2]
  end
end
