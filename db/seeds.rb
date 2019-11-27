
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
teacher_user = User.create!(first_name: 'Kate', last_name: 'Haywood', email: 'khaywood@teacher.com', password: '123123', teacher: true, photo: "teacher1" )
main_student = User.create!(first_name: 'Jamie', last_name: 'Smith', email: 'jren@student.com', password: '123123', teacher: false, photo: "male1")

female_students = []
female_count = 1

10.times do
  female_students << User.create!(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123123', teacher: false, photo: "female" + female_count.to_s)
  female_count += 1
end

male_students = []
male_count = 2

10.times do
  male_students << User.create!(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123123', teacher: false, photo: "male" + male_count.to_s)
  male_count += 1
end

students_array = male_students + female_students

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

main_subject = Subject.create!(name: "9C Science", photo: "science3.png", user: teacher_user )
Subject.create!(name: "8A Science", photo: "science1.png", user: teacher_user )
Subject.create!(name: "11B Science", photo: "science2.png", user: teacher_user )
Subject.create!(name: "7A Math", photo: "math1.png", user: teacher_user )
Subject.create!(name: "8B Math", photo: "math2.png", user: teacher_user )
Subject.create!(name: "8C Science", photo: "math3.png", user: teacher_user )

#Daily Emotions
# 19 students with one emotion
# 1 student with emotion history for 2 months
puts 'Creating Daily Emotions...'
student_emotion_array = []
emotion_range = Emotion.all.slice(0,3)
60.times do
  student_emotion_array << DailyEmotion.create!(emotion: emotion_range.sample, user: main_student)
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
