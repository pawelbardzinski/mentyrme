# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

homeImprovement = Category.create(name: 'Home Improvement', url_slug: 'home-improvement')
Category.create(name: 'Interior Design', url_slug: 'interior-design')
Category.create(name: 'Landscape Design', url_slug: 'landscape-design')
Category.create(name: 'Professional Organization', url_slug: 'professional-organization')
Category.create(name: 'Food', url_slug: 'food')
Category.create(name: 'Dog Training', url_slug: 'dog-training')

Tag.create(name: 'Tiling', category: homeImprovement)
Tag.create(name: 'Flooring', category: homeImprovement)
Tag.create(name: 'Cabinets', category: homeImprovement)
Tag.create(name: 'Painting', category: homeImprovement)
Tag.create(name: 'Patching', category: homeImprovement)
Tag.create(name: 'Trim', category: homeImprovement)
Tag.create(name: 'Roof Repaier & Gutters', category: homeImprovement)
Tag.create(name: 'Appliance / Fixture Installation', category: homeImprovement)
Tag.create(name: 'Window Treatments', category: homeImprovement)
Tag.create(name: 'Decks & Porches', category: homeImprovement)
Tag.create(name: 'Caulking / Insulation', category: homeImprovement)
Tag.create(name: 'Sustainability', category: homeImprovement)
Tag.create(name: 'Plumbing', category: homeImprovement)
Tag.create(name: 'Siding', category: homeImprovement)
Tag.create(name: 'Kid Proofing', category: homeImprovement)

AvailabilityPeriod.create(name: 'All Day', start_time: '07:00:00', end_time: '23:00:00')
AvailabilityPeriod.create(name: 'Morning (8:00am - 12:00pm)', start_time: '08:00:00', end_time: '12:00:00')
AvailabilityPeriod.create(name: 'Afternoon (12:00pm - 5:00pm)', start_time: '12:00:00', end_time: '17:00:00')
AvailabilityPeriod.create(name: 'Evening (5:00pm - 10:00pm)', start_time: '17:00:00', end_time: '22:00:00')
AvailabilityPeriod.create(name: 'Custom')


TimeSlot.create(start_time: '8:00 AM', end_time: '9:00 AM')
TimeSlot.create(start_time: '9:00 AM', end_time: '10:00 AM')
TimeSlot.create(start_time: '10:00 AM', end_time: '11:00 AM')
TimeSlot.create(start_time: '11:00 AM', end_time: '12:00 PM')
TimeSlot.create(start_time: '12:00 PM', end_time: '1:00 PM')
TimeSlot.create(start_time: '1:00 PM', end_time: '2:00 PM')
TimeSlot.create(start_time: '2:00 PM', end_time: '3:00 PM')
TimeSlot.create(start_time: '3:00 PM', end_time: '4:00 PM')
TimeSlot.create(start_time: '4:00 PM', end_time: '5:00 PM')
TimeSlot.create(start_time: '5:00 PM', end_time: '6:00 PM')
TimeSlot.create(start_time: '6:00 PM', end_time: '7:00 PM')
TimeSlot.create(start_time: '7:00 PM', end_time: '8:00 PM')
TimeSlot.create(start_time: '8:00 PM', end_time: '9:00 PM')
TimeSlot.create(start_time: '9:00 PM', end_time: '10:00 PM')
TimeSlot.create(start_time: '10:00 PM', end_time: '11:00 PM')

User.create(email: "none@gmail.com", first_name: "Johnny", last_name: "Mnemonic", zip_code: "91789", password: 'verylongpassword1!')
User.create(email: "none5@none.com", first_name: "Princess", last_name: "Leya", zip_code: "91789", merchant_account_id: "princess_princess_instant_668nxqgs", password: 'verylongpassword1!')
User.create(email: "none4@none.com", first_name: "Han", last_name: "Solo", zip_code: "91789", merchant_account_id: "han_han_instant_qwpznfhy", password: 'verylongpassword1!')
User.create(email: "none3@none.com", first_name: "Luke", last_name: "Skywalker", zip_code: "91789",  merchant_account_id: "luke_luke_instant_rggxzxrg", password: 'verylongpassword1!')
User.create(email: "none2@none.com", first_name: "Palpatine", last_name: "Cosinga", zip_code: "91789", merchant_account_id: "palpatine_palpatine_instant_8x9kyk88", password: 'verylongpassword1!')
User.create(email: "none@none.com", first_name: "Chewbacca", last_name: "Wookiee", zip_code: "91789", merchant_account_id: "chewbacca_chewbacca_instant_h2g64qhy", password: 'verylongpassword1!')

Transaction.create(user_id: 1, pay_to_mentor_id: 5, title: "Teach me how to run an Empire", amount: 999.00, state: 'future')
Transaction.create(user_id: 1, pay_to_mentor_id: 6, title: "I want to Growl really loud", amount: 15.00, state: 'transactions')
Transaction.create(user_id: 1, pay_to_mentor_id: 4, title: "I want to Destroy a Death Star", amount: 125.00, state: 'future')
Transaction.create(user_id: 1, pay_to_mentor_id: 3, title: "Teach me how to Exceed Speed of Light", amount: 1250.00, state: 'future')
Transaction.create(user_id: 1, pay_to_mentor_id: 3, title: "Please teach me how to smuggle contraband", amount: 100.00, state: 'transactions')
Transaction.create(user_id: 1, pay_to_mentor_id: 2, title: "I want to have Royal Manners", amount: 250.00, state: 'future')


Validation.create(name: 'Verify Your Id', description: 'Lorem ipsome dolor sit amet')
Validation.create(name: 'Email Address', description: 'Lorem ipsome dolor sit amet', value_label: "Email")
Validation.create(name: 'Phone Number', description: 'Lorem ipsome dolor sit amet', value_label: "Phone")
Validation.create(name: 'Facebook', description: 'Lorem ipsome dolor sit amet', value_label: "URL")
Validation.create(name: 'LinkedIn', description: 'Lorem ipsome dolor sit amet', value_label: "URL")
