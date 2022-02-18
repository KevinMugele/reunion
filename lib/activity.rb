# frozen_string_literal: true

class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.sum do |_name, amount_paid|
      amount_paid
    end
  end

  def split
    total_cost / @participants.keys.length
  end

  def owed
    money_owed = {}
    @participants.each do |name, amount_paid|
      money_owed[name] = (split - amount_paid) if money_owed[name].nil?
    end
    money_owed
  end
end
