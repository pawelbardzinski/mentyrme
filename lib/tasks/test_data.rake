# Load testing data.
# Run using the command 'rake app:load_demo_data'
# task :load_demo_data => [:environment] do

# Only data not required in production should be here.
# If it needs to be there in production, it belongs in seeds.rb.

namespace :app do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake app:load_demo_data'
  DESC
  task :load_demo_data => [:environment] do

  # Only data not required in production should be here.
  # If it needs to be there in production, it belongs in seeds.rb.

  User.destroy_all

  user1 = User.create(email: "none@gmail.com", first_name: "Johnny", last_name: "Mnemonic", zip_code: "91789", password: 'verylongpassword1!')
	user2 = User.create(email: "none5@none.com", first_name: "Princess", last_name: "Leya", role: 1, zip_code: "91789", merchant_account_id: "princess_princess_instant_668nxqgs", password: 'verylongpassword1!')
	user3 = User.create(email: "none4@none.com", first_name: "Han", last_name: "Solo", role: 1, zip_code: "91789", merchant_account_id: "han_han_instant_qwpznfhy", password: 'verylongpassword1!')
	user4 = User.create(email: "none3@none.com", first_name: "Luke", last_name: "Skywalker", role: 1, zip_code: "91789", merchant_account_id: "luke_luke_instant_rggxzxrg", password: 'verylongpassword1!')
	user5 = User.create(email: "none2@none.com", first_name: "Palpatine", last_name: "Cosinga", role: 1, zip_code: "91789", merchant_account_id: "palpatine_palpatine_instant_8x9kyk88", password: 'verylongpassword1!')
	user6 = User.create(email: "none@none.com", first_name: "Chewbacca", last_name: "Wookiee", role: 1, zip_code: "91789", merchant_account_id: "chewbacca_chewbacca_instant_h2g64qhy", password: 'verylongpassword1!')
  user2.profile.build_out_mentor_profile
  user3.profile.build_out_mentor_profile
  user4.profile.build_out_mentor_profile
  user5.profile.build_out_mentor_profile
  user6.profile.build_out_mentor_profile

	Transaction.create(user_id: user1.id, pay_to_mentor_id: user5.id, title: "Teach me how to run an Empire", amount: 999.00, state: 'future')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user6.id, title: "I want to Growl really loud", amount: 15.00, state: 'future')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user4.id, title: "I want to Destroy a Death Star", amount: 125.00, state: 'completed')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user3.id, title: "Teach me how to Exceed Speed of Light", amount: 1250.00, state: 'completed')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user3.id, title: "Please teach me how to smuggle contraband", amount: 100.00, state: 'future')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user2.id, title: "I want to have Royal Manners", amount: 250.00, state: 'future')


  homeImp = Category.find_by(name: "Home Improvement")

  user7 = User.create(email: "jack@email.com", first_name: "Jack", last_name: "Nicholson", zip_code: "63303", password: "password", role: 1)
  user8 = User.create(email: "marlon@email.com", first_name: "Marlon", last_name: "Brando", zip_code: "63301", password: "password", role: 1)
  user9 = User.create(email: "robert@email.com", first_name: "Robert", last_name: "De Niro", zip_code: "63146", password: "password", role: 1)
  user10 = User.create(email: "al@email.com", first_name: "Al", last_name: "Pacino", zip_code: "63031", password: "password", role: 1)
  user11 = User.create(email: "daniel@email.com", first_name: "Daniel", last_name: "Day-Lewis", zip_code: "63101", password: "password", role: 1)
  user12 = User.create(email: "dustin@email.com", first_name: "Dustin", last_name: "Hoffman", zip_code: "63042", password: "password", role: 1)
  user13 = User.create(email: "tom@email.com", first_name: "Tom", last_name: "Hanks", zip_code: "63021", password: "password")
  user14 = User.create(email: "anthony@email.com", first_name: "Anthony", last_name: "Hopkins", zip_code: "63017", password: "password", role: 1)
  user15 = User.create(email: "paul@email.com", first_name: "Paul", last_name: "Newman", zip_code: "63005", password: "password", role: 1)
  user16 = User.create(email: "denzel@email.com", first_name: "Denzel", last_name: "Washington", zip_code: "63113", password: "password", role: 1)
  user17 = User.create(email: "spencer@email.com", first_name: "Spencer", last_name: "Tracy", zip_code: "63044", password: "password", role: 1)
  user18 = User.create(email: "laurence@email.com", first_name: "Laurence", last_name: "Olivier", zip_code: "63050", password: "password", role: 1)
  user19 = User.create(email: "jeff@email.com", first_name: "Jeff", last_name: "Bridges", zip_code: "63386", password: "password", role: 1)
  user20 = User.create(email: "james@email.com", first_name: "James", last_name: "Stewart", zip_code: "63348", password: "password", role: 1)
  user21 = User.create(email: "sean@email.com", first_name: "Sean", last_name: "Penn", zip_code: "63105", password: "password", role: 1)
  user22 = User.create(email: "michael@email.com", first_name: "Michael", last_name: "Caine", zip_code: "63122", password: "password", role: 1)
  user23 = User.create(email: "morgan@email.com", first_name: "Morgan", last_name: "Freeman", zip_code: "63128", password: "password", role: 1)
  user24 = User.create(email: "gene@email.com", first_name: "Gene", last_name: "Hackman", zip_code: "63147", password: "password", role: 1)
  user25 = User.create(email: "clint@email.com", first_name: "Clint", last_name: "Eastwood", zip_code: "63131", password: "password", role: 1)
  user26 = User.create(email: "gregory@email.com", first_name: "Gregory", last_name: "Peck", zip_code: "63390", password: "password", role: 1)
  user27 = User.create(email: "robin@email.com", first_name: "Robin", last_name: "Williams", zip_code: "63379", password: "password", role: 1)
  user28 = User.create(email: "ben@email.com", first_name: "Ben", last_name: "Kingsley", zip_code: "63025", password: "password", role: 1)
  user29 = User.create(email: "philip@email.com", first_name: "Philip", last_name: "Seymour Hoffman", zip_code: "63026", password: "password", role: 1)
  user30 = User.create(email: "johnny@email.com", first_name: "Johnny", last_name: "Depp", zip_code: "63088", password: "password", role: 1)
  user31 = User.create(email: "leo@email.com", first_name: "Leo", last_name: "DiCaprio", zip_code: "63074", password: "password", role: 1)
  user32 = User.create(email: "tommy@email.com", first_name: "Tommy", last_name: "Lee Jones", zip_code: "63043", password: "password", role: 1)
  user33 = User.create(email: "russell@email.com", first_name: "Russell", last_name: "Crowe", zip_code: "63109", password: "password", role: 1)
  user34 = User.create(email: "kevin@email.com", first_name: "Kevin", last_name: "Spacey", zip_code: "63112", password: "password", role: 1)
  user35 = User.create(email: "john@email.com", first_name: "John", last_name: "Wayne", zip_code: "63123", password: "password", role: 1)
  user36 = User.create(email: "humphrey@email.com", first_name: "Humphrey", last_name: "Bogart", zip_code: "63122", password: "password", role: 1)
  user37 = User.create(email: "clark@email.com", first_name: "Clark", last_name: "Gable", zip_code: "63103", password: "password", role: 1)

  Skill.update_all(category_id: homeImp.id)

  user7.profile.build_out_mentor_profile
  user8.profile.build_out_mentor_profile
  user9.profile.build_out_mentor_profile
  user10.profile.build_out_mentor_profile
  user11.profile.build_out_mentor_profile
  user12.profile.build_out_mentor_profile
  user13.profile.build_out_mentor_profile
  user14.profile.build_out_mentor_profile
  user15.profile.build_out_mentor_profile
  user16.profile.build_out_mentor_profile
  user17.profile.build_out_mentor_profile
  user18.profile.build_out_mentor_profile
  user19.profile.build_out_mentor_profile
  user20.profile.build_out_mentor_profile
  user21.profile.build_out_mentor_profile
  user22.profile.build_out_mentor_profile
  user23.profile.build_out_mentor_profile
  user24.profile.build_out_mentor_profile
  user25.profile.build_out_mentor_profile
  user26.profile.build_out_mentor_profile
  user27.profile.build_out_mentor_profile
  user28.profile.build_out_mentor_profile
  user29.profile.build_out_mentor_profile
  user30.profile.build_out_mentor_profile
  user31.profile.build_out_mentor_profile
  user32.profile.build_out_mentor_profile
  user33.profile.build_out_mentor_profile
  user34.profile.build_out_mentor_profile
  user35.profile.build_out_mentor_profile
  user36.profile.build_out_mentor_profile
  user37.profile.build_out_mentor_profile

  tiling = Tag.find_by(name: 'Tiling')
  flooring = Tag.find_by(name: 'Flooring')
  cabinets = Tag.find_by(name: 'Cabinets')
  painting = Tag.find_by(name: 'Painting')
  patching = Tag.find_by(name: 'Patching')
  trim = Tag.find_by(name: 'Trim')
  roof = Tag.find_by(name: 'Roof Repair & Gutters')
  appliance = Tag.find_by(name: 'Appliance / Fixture Installation')
  window = Tag.find_by(name: 'Window Treatments')
  deck = Tag.find_by(name: 'Decks & Porches')
  caulk = Tag.find_by(name: 'Caulking / Insulation')
  sustainability = Tag.find_by(name: 'Sustainability')
  plumbing = Tag.find_by(name: 'Plumbing')
  siding = Tag.find_by(name: 'Siding')
  kid = Tag.find_by(name: 'Kid Proofing')

  user7.profile.get_skill.tags << tiling
  user7.profile.get_skill.tags << flooring
  user7.profile.get_skill.tags << deck

  user8.profile.get_skill.tags << kid
  user8.profile.get_skill.tags << sustainability

  user9.profile.get_skill.tags << siding

  user10.profile.get_skill.tags << painting
  user10.profile.get_skill.tags << patching
  user10.profile.get_skill.tags << trim

  user11.profile.get_skill.tags << tiling
  user11.profile.get_skill.tags << window
  user11.profile.get_skill.tags << roof

  user12.profile.get_skill.tags << cabinets
  user12.profile.get_skill.tags << caulk
  user12.profile.get_skill.tags << deck

  user13.profile.get_skill.tags << kid
  user13.profile.get_skill.tags << tiling
  user13.profile.get_skill.tags << roof

  user14.profile.get_skill.tags << siding
  user14.profile.get_skill.tags << caulk

  user15.profile.get_skill.tags << tiling
  user16.profile.get_skill.tags << cabinets
  user17.profile.get_skill.tags << painting
  user18.profile.get_skill.tags << patching
  user19.profile.get_skill.tags << trim
  user20.profile.get_skill.tags << roof
  user21.profile.get_skill.tags << appliance
  user22.profile.get_skill.tags << window
  user23.profile.get_skill.tags << deck
  user24.profile.get_skill.tags << caulk
  user25.profile.get_skill.tags << sustainability
  user26.profile.get_skill.tags << plumbing
  user27.profile.get_skill.tags << siding
  user28.profile.get_skill.tags << kid
  user29.profile.get_skill.tags << flooring

  user30.profile.get_skill.tags << caulk
  user30.profile.get_skill.tags << window
  user30.profile.get_skill.tags << flooring

  user31.profile.get_skill.tags << appliance
  user31.profile.get_skill.tags << sustainability

  user32.profile.get_skill.tags << kid

  user33.profile.get_skill.tags << roof
  user33.profile.get_skill.tags << plumbing
  user33.profile.get_skill.tags << tiling

  user34.profile.get_skill.tags << deck
  user34.profile.get_skill.tags << sustainability
  user34.profile.get_skill.tags << plumbing

  user35.profile.get_skill.tags << patching
  user35.profile.get_skill.tags << caulk
  user35.profile.get_skill.tags << appliance

  user36.profile.get_skill.tags << kid
  user36.profile.get_skill.tags << window
  user36.profile.get_skill.tags << trim

  user37.profile.get_skill.tags << roof
  user37.profile.get_skill.tags << appliance



  user2.save
  user3.save
  user4.save
  user5.save
  user6.save
  user7.save
  user8.save
  user9.save
  user10.save
  user11.save
  user12.save
  user13.save
  user14.save
  user15.save
  user16.save
  user17.save
  user18.save
  user19.save
  user20.save
  user21.save
  user22.save
  user23.save
  user24.save
  user25.save
  user26.save
  user27.save
  user28.save
  user29.save
  user30.save
  user31.save
  user32.save
  user33.save
  user34.save
  user35.save
  user36.save
  user37.save



  end
end
