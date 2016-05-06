
####Users#####

iulia = Mentor.create(username: "iulia", full_name: "Iulia Boolean", email: "iulia@iulia.com", password: "password", type: "Mentor")

zack = Mentor.create(username: "zack", full_name: "Zack Mance", email: "zack@zack.com", password: "password", type: "Mentor")

emily = Student.create(username: "emily", full_name: "Emily Osowski", email: "emily@emily.com", password: "password", type: "Student")

alex = Student.create(username: "alex", full_name: "Alex Darrow", email: "alex@alex.com", password: "password", type: "Student")

kevin = Student.create(username: "kevin", full_name: "Kevin Perkins", email: "kevin@kevin.com", password: "password", type: "Student")


# ######Topics######

ajax = Topic.create(name: "ajax")
javascript = Topic.create(name: "javascript")
mvc = Topic.create(name: "mvc")
jquery = Topic.create(name: "jquery")
rest = Topic.create(name: "rest")
algorithms = Topic.create(name: "algorithms")

######Appointments####

User.first.appointments.create(date: Date.new, start_time: Time.new, end_time: Time.new, mentor_phase: 2)

a2 = iulia.appointments.create(date: Date.new, start_time: Time.new, end_time: Time.new, mentor_phase: 2)

a3 = zack.appointments.create(date: Date.new, start_time: Time.new, end_time: Time.new, mentor_phase: 2)

a2.update(student_id: 3)


#######Reviews#######

User.first.reviews.create(body: "You were amazzzzinngggg", rating: 5, appointment_id: 3)




