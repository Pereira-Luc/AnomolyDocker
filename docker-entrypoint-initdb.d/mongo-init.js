print('Start #################################################################');

// add Users to anomoly database
db = db.getSiblingDB('anomoly');


/* Only change the credatials unleas you now what you are doing */
db.createUser(
    {
        user: "testUser1",
        pwd: "1234",
        roles: [
            {
                role: "readWrite",
                db: "anomoly"
            }
        ]
    }
)

/* ---------------------------------------------------------------- */

db.createCollection("Users");
db.createCollection("Chats");
db.createCollection("Friends");
db.createCollection("ProfilePic");

print('END #################################################################');
