def sample_avatar
  File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
end

User.create!(name: "Алексей", email: "info@krdprog.ru", avatar: sample_avatar)

55.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  avatar = sample_avatar

  User.create!(name: name, email: email, avatar: avatar)
end
