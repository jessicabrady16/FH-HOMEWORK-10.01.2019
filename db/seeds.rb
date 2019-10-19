# frozen_string_literal: true

(1...50).each do |_i|
  Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    age: Random.rand(1...70),
    position: Player.positions[Random.rand(0..Player.positions.length)]
  )
end
