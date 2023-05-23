const express = require("express");
const PORT = process.env.PORT || 4000;
const bodyParser = require('body-parser');
//const firebase = require();


const signupRouter = require('./routes/signup')
const loginRouter = require('./routes/login')
const mapRouter = require('./routes/map')
const adminRouter = require('./routes/admin');
const homeRouter = require('./routes/home');
const addNoti = require('./routes/addNoti')
const user = require('./routes/user');
const deletePlaces = require('./routes/deletePlaces');
const trackingRouter = require('./routes/tracking');
const Organizer = require('./routes/deleteHotels');

const app = express();


app.use(express.static('views'));
app.use(bodyParser.urlencoded({extended:false}));

app.use(loginRouter);
app.use('/homeRouter',homeRouter);
app.use('/addPlaces',adminRouter);
app.use('/sendNotification',addNoti);
app.use('/users',user);
app.use('/deletePlaces',deletePlaces);
app.use('/Organizer',Organizer);
app.use('/map',mapRouter);
app.use('/login',loginRouter);
app.use('/signup',signupRouter);
app.use('/tracking',trackingRouter)


app.listen(PORT, () => {
    console.log(`Server is running at PORT ${PORT}`);
})
