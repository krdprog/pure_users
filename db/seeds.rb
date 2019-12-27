def sample_avatar
  File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
end

User.create!(name: "Алексей", email: "info@krdprog.ru", avatar: sample_avatar, password: "foobarbaz", password_confirmation: "foobarbaz")

55.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  avatar = sample_avatar
  password = password_confirmation = Faker::Internet.password(min_length: 10)

  User.create!(name: name, email: email, avatar: avatar, password: password, password_confirmation: password_confirmation)
end
