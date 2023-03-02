import mongoose from 'mongoose';
import fetch from 'node-fetch';
mongoose.connect('mongodb://127.0.0.1:27017/university-2023');

const advisorSchema = new mongoose.Schema({
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

getdata();