# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
mike = Owner.create(name: "Mike")
jon = Owner.create(name: "Jon")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)
Pet.create(name: "Emma", owner: mike)
Pet.create(name: "Max", owner: mike)
Pet.create(name: "Ryder", owner: jon)
