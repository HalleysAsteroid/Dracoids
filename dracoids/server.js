const express = require('express');
const { connectToDb, getDb } = require('./db')

//init app & middleware
const app = express();

//db connection
let db;

connectToDb((err) => {
    if (!err) {
        app.listen(3000, () => {
            console.log('Server listening on port 3000');
        })

        db = getDb();
    }
})

// handling CORS 
app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin",
        "http://localhost:4200");
    res.header("Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept");
    next();
});


// app.get('/', (req, res) => {
//     let collections = ['approaches', 'perks']
//     let dracoDB = {};

//     let i = 0;

//     collections.forEach(collectionName => {
//         let listData = {};
//         db.collection(collectionName).find({}).forEach(datum => {
//             listData[datum.name] = datum;
//             console.log("still working!")
//         })
//             .then(() => {
//                 dracoDB[collectionName] = listData;
//                 res.status(200);
//             }).then(() => {
//                 i++;
//                 if (i == collections.length)
//                     res.status(200).json(dracoDB)
//             })
//             .catch(() => {
//                 res.status(500).json({ error: 'Could not fetch the documents' })
//             });
//     })
// });


//Get database from root
app.get('/', (req, res) => {
    let collections = ['approaches', 'perks', 'soulabilities', 'kins', 'factiontiers']
    let dracoDB = {};

    let i = 0;

    collections.forEach(collectionName => {
        let listData = [];
        db.collection(collectionName).find({}).forEach(datum => {
            listData.push(datum)
        })
            .then(() => {
                dracoDB[collectionName] = listData;
                res.status(200);
            }).then(() => {
                i++;
                if (i == collections.length)
                    res.status(200).json(dracoDB)
            })
            .catch(() => {
                res.status(500).json({ error: 'Could not fetch the documents' })
            });
    })
});

//Get specified collection
app.get('/:collection', (req, res) => {
    let listData = [];

    db.collection(req.params.collection)
        .find()
        .forEach(datum => {
            listData.push(datum);
        })
        .then(() => {
            res.status(200).json(listData)
        })
})

//Get all perks for an approach
app.get('/perks/:approachName', (req, res) => {
    let listData = [];
    let approachName = "".concat([req.params.approachName.charAt(0).toUpperCase() + req.params.approachName.slice(1)]);

    db.collection("perks")
        .find({ "approach": approachName })
        .forEach(datum => {
            listData.push(datum);
        })
        .then(() => {
            res.status(200).json(listData)
        })
})

//Get individual approach
app.get('/approaches/:approach', (req, res) => {

    let approachName = "".concat([req.params.approach.charAt(0).toUpperCase() + req.params.approach.slice(1)]);

    db.collection("approaches")
        .findOne({ "name": approachName })
        .then(doc => {
            res.status(200).json(doc);
        })
        .catch(() => {
            res.status(500).json({ error: 'Could not fetch the documents' })
        });
});

//Get list of approaches
app.get('/approachNames/list', (req, res) => {

    let listData = [];

    db.collection("approaches")
        .find({})
        .forEach(datum => {
            listData.push(datum.name)
        })
        .then(() => {
            res.status(200).send(listData)
        })
})

//Get list of kins
app.get('/kinNames/list', (req, res) => {

    let listData = [];

    db.collection("kins")
        .find({})
        .forEach(datum => {
            listData.push(datum.name)
        })
        .then(() => {
            res.status(200).send(listData)
        })
})

//Get list of kins
app.get('/factionTierNames/list', (req, res) => {

    let listData = [];

    db.collection("factiontiers")
        .find({})
        .forEach(datum => {
            listData.push(datum.name)
        })
        .then(() => {
            res.status(200).send(listData)
        })
})

//Get list of approaches by ability modifier
app.get('/approachNames/:abilityMod', (req, res) => {

    let listData = [];

    db.collection("approaches")
        .find({ "ability_modifier": req.params.abilityMod })
        .forEach(datum => {
            listData.push(datum.name)
        })
        .then(() => {
            res.status(200).send(listData)
        })
})

//Get all Soul Abilities for an approach
app.get('/soulabilities/:approachName', (req, res) => {
    let listData = [];
    let approachName = "".concat([req.params.approachName.charAt(0).toUpperCase() + req.params.approachName.slice(1)]);

    db.collection("soulabilities")
        .find({ "approach": approachName })
        .forEach(datum => {
            listData.push(datum);
        })
        .then(() => {
            res.status(200).json(listData)
        })
})