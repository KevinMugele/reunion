# frozen_string_literal: true

require './lib/activity'

RSpec.describe Activity do
  it 'exists' do
    activity = Activity.new('Brunch')
    expect(activity).to be_a Activity
  end

  it 'has a name' do
    activity = Activity.new('Brunch')
    expect(activity.name).to eq('Brunch')
  end

  it 'has participants' do
    activity = Activity.new('Brunch')
    expect(activity.participants).to eq({})
  end

  it 'adds participants' do
    activity = Activity.new('Brunch')

    expect(activity.participants).to eq({})

    activity.add_participant('Maria', 20)

    expect(activity.participants).to eq({ 'Maria' => 20 })
  end

  it 'has a total cost' do
    activity = Activity.new('Brunch')
    expect(activity.total_cost).to eq(0)
  end

  it 'adds participants' do
    activity = Activity.new('Brunch')

    expect(activity.participants).to eq({})

    activity.add_participant('Maria', 20)

    expect(activity.participants).to eq({ 'Maria' => 20 })

    activity.add_participant('Luther', 40)

    expect(activity.participants).to eq({ 'Maria' => 20, 'Luther' => 40 })
    expect(activity.total_cost).to eq 60
  end

  it 'splits the cost' do
    activity = Activity.new('Brunch')
    activity.add_participant('Maria', 20)
    activity.add_participant('Luther', 40)

    expect(activity.total_cost).to eq 60
    expect(activity.split).to eq 30
  end

  it 'shows what is owed' do
    activity = Activity.new('Brunch')
    activity.add_participant('Maria', 20)
    activity.add_participant('Luther', 40)

    expect(activity.owed).to eq({ 'Maria' => 10, 'Luther' => -10 })
  end
end
