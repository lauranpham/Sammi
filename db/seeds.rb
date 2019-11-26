
puts 'Cleaning database...'

ClassMembership.destroy_all
Appointment.destroy_all
DailyEmotion.destroy_all
Subject.destroy_all
Emotion.destroy_all
User.destroy_all

#Users
# 1 teacher and 20 students
puts 'Creating Users...'
teacher_user = User.create!(first_name: 'Kate', last_name: 'Haywood', email: 'khaywood@teacher.com', password: '123123', teacher: true )
main_student = User.create!(first_name: 'Jamie', last_name: 'Smith', email: 'jren@student.com', password: '123123', teacher: false )

students_array = []
20.times do
 students_array << User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123123', teacher: false)
end

#Emotions
# establish emotions rating system
puts 'Creating Emotions...'
Emotion.create!(rating: 1)
Emotion.create!(rating: 2)
Emotion.create!(rating: 3)
Emotion.create!(rating: 4)
Emotion.create!(rating: 5)

#Subjects
# 6 subjects for the 1 teacher
puts 'Creating Subjects...'

main_subject = Subject.create!(name: "9C Science", photo: "assets/images/science3.png", user: teacher_user )
Subject.create!(name: "8A Science", photo: "assets/images/science1.png", user: teacher_user )
Subject.create!(name: "11B Science", photo: "assets/images/science2.png", user: teacher_user )
Subject.create!(name: "7A Math", photo: "assets/images/math1.png", user: teacher_user )
Subject.create!(name: "8B Math", photo: "assets/images/math2.png", user: teacher_user )
Subject.create!(name: "8C Science", photo: "assets/images/math3.png", user: teacher_user )

#Daily Emotions
# 19 students with one emotion
# 1 student with emotion history for 2 months
puts 'Creating Daily Emotions...'
student_emotion_array = []
60.times do
  student_emotion_array << DailyEmotion.create!(emotion: Emotion.all.sample, user: main_student)
end

count = 0
student_emotion_array.each do |emotion|
  emotion.date = Date.new(2019,12,6) - count
  count += 1
  emotion.save
end

students_array.each do |student|
  DailyEmotion.create!(emotion: Emotion.all.sample, user: student, date: Date.new(2019,12,6))
end

#Appointments
# 3 upcoming appointments, 2 past appointments
puts 'Creating Appointments...'

Appointment.create!(student: students_array[0], teacher: teacher_user, date: Date.new(2019,12,6))
Appointment.create!(student: students_array[1], teacher: teacher_user, date: Date.new(2019,12,6))
Appointment.create!(student: students_array[2], teacher: teacher_user, date: Date.new(2019,12,6))
Appointment.create!(student: students_array[3], teacher: teacher_user, date: Date.new(2019,11,23))
Appointment.create!(student: students_array[4], teacher: teacher_user, date: Date.new(2019,11,20))

# Class Memberships
# add all students to Year 9 Science subject
puts 'Creating Class Memberships...'
students_array.each do |student|
  ClassMembership.create!(user: student, subject: main_subject)
end

ClassMembership.create!(user: main_student, subject: main_subject)

puts 'Finished!'
