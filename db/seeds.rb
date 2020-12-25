require 'faker'

def create_user(first_name, last_name, email, password)
    user = User.create!(
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        mobile: Faker::PhoneNumber.cell_phone,
    )
end

def create_destination_and_trips(destintion)
    dest = Destination.create!(
        en_name: destintion,
        en_description: Faker::Lorem.paragraph,
        ar_name: destintion,
        ar_description: Faker::Lorem.paragraph
    )
    # dest.image.attach(io: File.open(Dir['app/assets/images/*.webp'].sample), filename: "destination.jpg")
    rand(3..5).times do |t|
        trip = Trip.create!(
            en_name: Faker::FunnyName.name,
            en_description: Faker::Lorem.paragraph,
            en_leaving_place: Faker::Game.title,
            ar_name: Faker::FunnyName.name,
            ar_description: Faker::Lorem.paragraph,
            ar_leaving_place: Faker::Game.title,
            leaving_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2),
            returning_time: Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 4),
            currency: rand(0..1),
            is_available: Faker::Boolean.boolean(true_ratio: 0.68),
            child_price: rand(100.0..200.0).round(2),
            adult_price: rand(300.0..500.0).round(2),
            destination_id: dest.id
        )
        # trip.images.attach(io: File.open(Dir['app/assets/images/*.webp'].sample), filename: "trip1.jpg")
        # trip.images.attach(io: File.open(Dir['app/assets/images/*.webp'].sample), filename: "trip2.jpg")
        # trip.images.attach(io: File.open(Dir['app/assets/images/*.webp'].sample), filename: "trip2.jpg")
        create_days_schedule(trip)
        create_offers(trip)
        create_reviews(trip)
    end
end

def create_days_schedule(trip)
    rand(1..2).times do |t|
        day = Day.create!(
            number: t + 1,
            trip_id: trip.id
            
        )
        rand(3..6).times do |t|
            Schedule.create!(
                time: Time.now + t*3600*48,
                en_name: Faker::FunnyName.name,
                ar_name: Faker::FunnyName.name,
                day_id: day.id
            )
        end
    end
end

def create_offers(trip)
    rand(3..6).times do |t|
        Offer.create!(
            en_name: Faker::FunnyName.name,
            ar_name: Faker::FunnyName.name,
            is_available: Faker::Boolean.boolean(true_ratio: 0.68),
            trip_id: trip.id
        )
    end
end

def create_reviews(trip)
    rand(2..4).times do |t|
        Review.create!(
            comment: Faker::Lorem.paragraph,
            trip_id: trip.id,
            user_id: User.all.sample.id
        )
    end
end

def create_posts
    Post.create!(
        en_title: Faker::FunnyName.name,
        en_body: Faker::Lorem.paragraph,
        ar_title: Faker::FunnyName.name,
        ar_body: Faker::Lorem.paragraph,
        user_id: User.where(superadmin_role: true).first.id
    )
end

create_user("ahmed", "abdelhamid", "ahmed@mail.com", "123456")
create_user("zeyad", "saleh", "zeyad@mail.com", "123456")

5.times do |t|
    create_user(Faker::Name.name, Faker::Name.name, Faker::Internet.email, "123456")
end

6.times do |t|
    create_destination_and_trips(Faker::Ancient.hero)
end

rand(3..6).times do |t|
    create_posts
end