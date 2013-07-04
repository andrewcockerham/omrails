namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      puts "[DEBUG] creating user fake #{n+20} of 10"
      name = Faker::Name.name
      email = "fake-#{n+20}@example.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end

    User.last(10).each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      10.times do |n|
        image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
        description = %w(cool awesome crazy wow adorbs incredible).sample
        user.pins.create!(image: image, description: description)
      end
    end
  end
end