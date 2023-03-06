import mongoose from 'mongoose';
import fetch from 'node-fetch';
mongoose.connect('mongodb://127.0.0.1:27017/university-2023');

/*const advisorSchema = new mongoose.Schema({
      s_ID: {type:String},
      i_ID: {type:String}
});


let advisor =new mongoose.model('advisor', advisorSchema);

let API = 'http://localhost:8000';

async function getdata() {
  const res = await fetch(API);
  const data = await res.json();
  try {
    let inserted = await advisor.insertMany(data);
    console.log(inserted);
    process.exit(0);
  } catch (e) {
    console.log('Some error');
    console.log(e);
    process.exit(0);
  }
}

getdata();*/

const universitySchema = new mongoose.Schema({
   advisor:[{ s_ID: {type:String},
              i_ID: {type:String}}],
 classroom:[{building:{type:String},
             room_number:{type:String},
             capacity:{type:String}
            }]
});

const data = [{
  "advisor":[{"i_ID": "45565", "s_ID": "00128"}, {"i_ID": "10101", "s_ID": "12345"}, {"i_ID": "76543", "s_ID": "23121"}, {"i_ID": "22222", "s_ID":      "44553"}, {"i_ID": "22222", "s_ID": "45678"}, {"i_ID": "45565", "s_ID": "76543"}, {"i_ID": "98345", "s_ID": "76653"}, {"i_ID": "98345", "s_ID": "98765"}, {"i_ID": "76766", "s_ID": "98988"}],
  "classroom":[{"building": "Packard", "capacity": 500, "room_number": "101"}, {"building": "Painter", "capacity": 10, "room_number": "514"}, {"building": "Taylor", "capacity": 70, "room_number": "3128"}, {"building": "Watson", "capacity": 30, "room_number": "100"}, {"building": "Watson", "capacity": 50, "room_number": "120"}]
}]

let university =new mongoose.model('university', universitySchema);

let API = 'http://localhost:8000';

async function getdata() {
const res = await fetch(API);
//const data = await res.json();
try {
  let inserted = await university.insertMany(data);
  console.log(inserted);
  process.exit(0);
} catch (e) {
  console.log('Some error');
  console.log(e);
  process.exit(0);
}
}

getdata();