# frozen_string_literal: true

require './lib/reunion'
require './lib/activity'

RSpec.describe Reunion do
  it 'exists' do
    reunion = Reunion.new('1406 BE')

    expect(reunion).to be_a Reunion
  end

  it 'has a name' do
    reunion = Reunion.new('1406 BE')

    expect(reunion.name).to eq('1406 BE')
  end

  it 'has activities' do
    reunion = Reunion.new('1406 BE')

    expect(reunion.activities).to eq([])
  end

  it 'adds activities' do
    reunion = Reunion.new('1406 BE')
    activity_1 = Activity.new('Brunch')

    reunion.add_activity(activity_1)

    expect(reunion.activities).to eq([activity_1])
  end

  it 'shows the total cost of the reunion' do
    reunion = Reunion.new('1406 BE')
    activity_1 = Activity.new('Brunch')
    activity_1.add_participant('Maria', 20)
    activity_1.add_participant('Luther', 40)
    reunion.add_activity(activity_1)

    expect(reunion.total_cost).to eq 60

    activity_2 = Activity.new('Drinks')
    activity_2.add_participant('Maria', 60)
    activity_2.add_participant('Luther', 60)
    activity_2.add_participant('Louis', 0)
    reunion.add_activity(activity_2)

    expect(reunion.total_cost).to eq 180
  end

  it 'shows the breakout' do
    reunion = Reunion.new('1406 BE')
    activity_1 = Activity.new('Brunch')
    activity_1.add_participant('Maria', 20)
    activity_1.add_participant('Luther', 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new('Drinks')
    activity_2.add_participant('Maria', 60)
    activity_2.add_participant('Luther', 60)
    activity_2.add_participant('Louis', 0)
    reunion.add_activity(activity_2)

    expect(reunion.breakout).to eq({ 'Maria' => -10, 'Luther' => -30, 'Louis' => 40 })
    expect(reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
  end
end
