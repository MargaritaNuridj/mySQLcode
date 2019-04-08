//1) Insert 5 records in user collection with name ,age ,grade and position as student(5)
db.students.insert({name: "Mark", age: "25", grade: "23", position: "student"});
db.students.insert({name: "Melissa", age: "24", grade: "20", position: "student"})
db.students.insert({name: "Vanessa", age: "28", grade: "10", position: "student"})
db.students.insert({name: "Mike", age: "18", grade: "90", position: "student"})
db.students.insert({name: "Tom", age: "20", grade: "6", position: "student"})

//2) Insert 5 records in user collection with name ,age and position as Lecturer(5) 
db.students.insert({name: "Frank", age: "30",  position: "lecturer"})
db.students.insert({name: "Tom", age: "60",  position: "lecturer"})
db.students.insert({name: "Nick", age: "50",  position: "lecturer"})
db.students.insert({name: "Anna", age: "47",  position: "lecturer"})
db.students.insert({name: "Christin", age: "40", position: "lecturer"})

//3) Find the number of rows in the collection User.(5)
db.students.find().count();

//4) Find the number of students who have grade more than 80.(5)
db.students.find({'grade': {$gt: '80'}}).toArray();

//5) Find number of students who are more than age 20.
db.students.find({'age': {$gt: '20'}}).toArray();

//6) Find out students who has the maximum grade(5)
db.students.find().sort({"grade": -1}).limit(1);

//7) Find out the students who has the minimum grade(5).
db.students.find().sort({"grade": +1}).limit(1);

//8) Find the average of grade of all the students(5).
db.students.aggregate([{$match:{position: "student"}}, {$group: {_id: null, avgGrade: {$avg: "$grade"}}}]);

//9) Find out the number of Lecturer in the user collections(5).
db.students.find({position: "Lecturer"}).count();