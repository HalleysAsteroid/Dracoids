const { MongoClient } = require('mongodb');
const uri = "mongodb+srv://120ldaniels:kWXdDSy9gmerGCGQ@dracoidsdb.0gk7jsd.mongodb.net/dracoidsDB?retryWrites=true&w=majority";

let dbConnection;

module.exports = {
    connectToDb: (cb) => {
        MongoClient.connect(uri)
            .then((client) => {
                dbConnection = client.db();
                return cb();
            })
            .catch(err => {
                console.log(err);
                return cb(err);
            })
    },
    getDb: () => { return dbConnection }
}