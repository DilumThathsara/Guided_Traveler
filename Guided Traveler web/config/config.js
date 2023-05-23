const firebase = require('firebase')
firebaseConfig = {
  apiKey: "AIzaSyCo-FzB5qhRzfBCVPlBEcX_As1ercpCn78",
  authDomain: "guided-traveler.firebaseapp.com",
  projectId: "guided-traveler",
  storageBucket: "guided-traveler.appspot.com",
  messagingSenderId: "870682354873",
  appId: "1:870682354873:web:782374defda1d0eb90a768",
  measurementId: "G-KCD3E97PLC"
};

firebase.initializeApp(firebaseConfig);
let database = firebase.database()
database.ref("customPath").set(obj, function(error) {
    if (error) {
      // The write failed...
      console.log("Failed with error: " + error)
    } else {
      // The write was successful...
      console.log("success")
    }
})
// const visitingPlaces = db.collection("visitingPlaces")
// module.exports = visitingPlaces;