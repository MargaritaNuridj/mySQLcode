//1.Insert an object containing name of "Mark", age of 25 and position of "lecturer" to users collection.
db.users.insert({name: "Mark", age: "25", position: "lecturer"});
//2.Insert another user object containing name of "Alice", age of 20, position of "student" and grade of 84 to users collection
db.users.insert({name: "Alice", age: "20", position: "student", grade:"84"});
//3.Insert another user object containing name of "Bob", age of 21, position of "student" and grade of 89 to userscollection
db.users.insert({name: "Bob", age: "21", position: "student", grade:"89"});
//4.Find users of age between 20 to 23 (inclusive)
      //  hint: at the end of find(), please append toArray() for testing.
db.users.find({'age': {$gt: '20', $lt: '23'}}).toArray();
//5.Find students who have a grade more than 80.
db.users.find({'grade': {$gt: '80'}}).toArray();
//6.Find Students who have a age more than 20 and score more than 80.
  db.users.find({'age': {$gt: '20'}}, {'score': {$gt: '80'}}).toArray();
//7. Delete user bob
      //  use db.users.find().toArray() to test result
db.users.deleteOne({name: "Bob"});
db.users.find().toArray()
//8.Update user object of 'Alice' to grade 95
      //  use db.users.find().toArray() to test result
db.users.deleteOne({name: "Bob"});
db.users.find().toArray()
//9.Update Mark to have a new field called homeAddress containing of following json:
    /*{
        street: '1234 Random st.',
        city: 'Los Angeles',
        state: 'CA'
    }*/
db.users.updateOne({name: "Mark"},  {$set: {street: "1234 Random st.",city: "Los Angeles",state: "CA"}});
   
//10.Find all the lecturer from the user collections and display the result
//Command to show result using cursor is as below:
cursor = db.users.find("lecturer");
	while (cursor.hasNext()) 
	{ printjson(cursor.next());
	}