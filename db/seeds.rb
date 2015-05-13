# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#################### USERS ######################

User.create(firstname: 'Trevor', lastname: 'Spears', email: 'trevor@spears.com', tel: '4252050766', password: 'trevorspears', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/556.jpg')

User.create(firstname: 'Lauren', lastname: 'Go', email: 'lauren@go.com', tel: '0000002', password: 'laurengo', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/553.jpg')

User.create(firstname: 'Dave', lastname: 'Raskin', email: 'dave@raskin.com', tel: '3056078974', password: 'daveraskin', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/554.jpg')

User.create(firstname: 'Alex', lastname: 'Nguyen', email: 'alex@nguyen.com', tel: '0000004', password: 'alexnguyen', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/549.jpg')

User.create(firstname: 'Mark', lastname: 'Bradford', email: 'mark@bradford.com', tel: '0000005', password: 'markbradford', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/550.jpg')

User.create(firstname: 'Timon', lastname: 'Pike', email: 'timon@pike.com', tel: '0000006', password: 'timonpike', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/545.jpg')

User.create(firstname: 'Nick', lastname: 'Cronquist', email: 'nick@cronquist.com', tel: '0000007', password: 'nickcronquist', image: 'http://www.peopleofwalmart.com/wp-content/uploads/2015/05/546.jpg')

################### GROUPS #####################

Group.create(name: "Trevor's Group", size: 10, status: true, user_id: 1, image: 'http://upload.wikimedia.org/wikipedia/commons/d/d9/Test.png')

Group.create(name: "Lauren's Group", size: 12, status: true, user_id: 2, image: 'https://www.bewelcome.org/groups/realimg/451')

Group.create(name: "Dave's Group", size: 5, status: false, user_id: 3, image: 'http://cdn2-b.examiner.com/sites/default/files/styles/image_content_width/hash/a8/c0/a8c04b45b3a7282b874b2473e77c32a9.jpg?itok=UTaG1AAP')

Group.create(name: "Alex's Group", size: 420, status: false, user_id: 4, image: 'http://usercontent1.hubimg.com/2213864_f496.jpg')

Group.create(name: "Mark's Group", size: 8, status: true, user_id: 5, image: 'http://www.veryfunnycats.info/wp-content/uploads/2007/02/funnycatsgroup1.jpg')

Group.create(name: "Timon's Group", size: 42, status: true, user_id: 6, image: 'http://twistedsifter.files.wordpress.com/2010/11/street-fighter-mortal-kombat-group-funny-halloween-costume.jpg')

################### MEMBERSHIPS ##########################

#----------------TREVOR------------------#
Membership.create(group_id: 1, user_id: 1, admin: true, block: false)
Membership.create(group_id: 1, user_id: 2, admin: false, block: true)
Membership.create(group_id: 1, user_id: 3, admin: true, block: false)
Membership.create(group_id: 1, user_id: 4, admin: true, block: true)
Membership.create(group_id: 1, user_id: 5, admin: true, block: false)
Membership.create(group_id: 1, user_id: 6, admin: false, block: false)
Membership.create(group_id: 1, user_id: 7, admin: false, block: false)

#----------------LAUREN------------------#
Membership.create(group_id: 2, user_id: 1, admin: false, block: false)
Membership.create(group_id: 2, user_id: 2, admin: true, block: false)
Membership.create(group_id: 2, user_id: 3, admin: false, block: true)
Membership.create(group_id: 2, user_id: 4, admin: false, block: false)
Membership.create(group_id: 2, user_id: 5, admin: true, block: false)
Membership.create(group_id: 2, user_id: 6, admin: false, block: false)

#----------------DAVE------------------#
Membership.create(group_id: 3, user_id: 1, admin: true, block: false)
Membership.create(group_id: 3, user_id: 2, admin: true, block: false)
Membership.create(group_id: 3, user_id: 3, admin: true, block: false)
Membership.create(group_id: 3, user_id: 4, admin: false, block: true)
Membership.create(group_id: 3, user_id: 5, admin: false, block: false)

#----------------ALEX------------------#
Membership.create(group_id: 4, user_id: 1, admin: true, block: false)
Membership.create(group_id: 4, user_id: 3, admin: true, block: false)
Membership.create(group_id: 4, user_id: 4, admin: true, block: false)
Membership.create(group_id: 4, user_id: 5, admin: false, block: false)


#----------------MARK------------------#
Membership.create(group_id: 5, user_id: 5, admin: true, block: false)
Membership.create(group_id: 5, user_id: 4, admin: false, block: false)
Membership.create(group_id: 5, user_id: 2, admin: false, block: false)

#----------------TIMON------------------#
Membership.create(group_id: 6, user_id: 6, admin: true, block: false)
Membership.create(group_id: 6, user_id: 1, admin: false, block: false)

#----- Nick is the user who is not signed up ------#

################## EVENTS ######################

Event.create(name: "Trevor's Event", desc: 'An Event by Trevor', min: 5, max: 10, loc: "Trevor's Place", date: '1/2', day: 0, time: '1:30', group_id: 1)

Event.create(name: "Trevor's Event 2", desc: 'An Event by Trevor 2', min: 5, max: 10, loc: "Trevor's Place", date: '2/1', day: 0, time: '2:30', group_id: 1)

Event.create(name: "Lauren's Event", desc: 'An Event by Lauren', min: 4, max: 11, loc: "Lauren's Place", date: '2/3', day: 1, time: '2:30', group_id: 2)

Event.create(name: "Dave's Event", desc: 'An Event by Dave', min: 6, max: nil, loc: "Dave's Place", date: '3/4', day: 2, time: '3:00', group_id: 3)

Event.create(name: "Alex's Event", desc: 'An Event by Alex', min: 2, max: 421, loc: "Alex's Place", date: '4/2', day: 3, time: '4:20', group_id: 4)

Event.create(name: "Mark's Event", desc: 'An Event by Mark', min: 4, max: 8, loc: "Mark's Place", date: '4/2', day: 4, time: '4:20', group_id: 5)
########### ^^^ TEST OF TWO IDENTICLE TIMES AND DATES

Event.create(name: "Timon's Event", desc: 'An Event by Timon', min: 5, max: 10, loc: "Timon's Place", date: '3/14', day: 5, time: '6:28', group_id: 6)

################# ATTENDANCES ###################

#---------------- TREVOR --------------------#

Attendance.create(event_id: 1, user_id: 1, yes: true, maybe: false, no: false)
Attendance.create(event_id: 1, user_id: 2, yes: true, maybe: false, no: false)
Attendance.create(event_id: 1, user_id: 3, yes: true, maybe: false, no: false)
Attendance.create(event_id: 1, user_id: 4, yes: true, maybe: false, no: false)
Attendance.create(event_id: 1, user_id: 5, yes: false, maybe: true, no: false)
Attendance.create(event_id: 1, user_id: 6, yes: false, maybe: false, no: true)
Attendance.create(event_id: 1, user_id: 7, yes: false, maybe: true, no: false)

#----------------- LAUREN -------------------#

Attendance.create(event_id: 2, user_id: 2, yes: true, maybe: false, no: false)
Attendance.create(event_id: 2, user_id: 3, yes: true, maybe: false, no: false)
Attendance.create(event_id: 2, user_id: 4, yes: false, maybe: true, no: false)
Attendance.create(event_id: 2, user_id: 5, yes: true, maybe: false, no: false)
Attendance.create(event_id: 2, user_id: 6, yes: false, maybe: false, no: true)
Attendance.create(event_id: 2, user_id: 1, yes: true, maybe: false, no: false)

#------------------- DAVE ---------------------#

Attendance.create(event_id: 3, user_id: 3, yes: true, maybe: false, no: false)
Attendance.create(event_id: 3, user_id: 4, yes: true, maybe: false, no: false)
Attendance.create(event_id: 3, user_id: 5, yes: true, maybe: false, no: false)
Attendance.create(event_id: 3, user_id: 2, yes: true, maybe: false, no: false)
Attendance.create(event_id: 3, user_id: 1, yes: true, maybe: false, no: true)
############ ^^^ TEST OF 2 TRUES

#-------------------- ALEX ----------------------#

Attendance.create(event_id: 4, user_id: 4, yes: false, maybe: false, no: false)
############################################ ^^^ NOT GOING TO OWN EVENT
Attendance.create(event_id: 4, user_id: 1, yes: true, maybe: false, no: false)
Attendance.create(event_id: 4, user_id: 5, yes: true, maybe: false, no: false)
Attendance.create(event_id: 4, user_id: 3, yes: true, maybe: false, no: false)

#------------------ MARK ---------------------#

Attendance.create(event_id: 5, user_id: 5, yes: true, maybe: false, no: false)
Attendance.create(event_id: 5, user_id: 4, yes: false, maybe: false, no: true)
Attendance.create(event_id: 5, user_id: 1, yes: true, maybe: false, no: false)
################################# ^^^ ATTENDING NOT IN GROUP

Attendance.create(event_id: 6, user_id: 6, yes: true, maybe: false, no: false)
Attendance.create(event_id: 6, user_id: 1, yes: true, maybe: false, no: false)