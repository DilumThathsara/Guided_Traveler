const path = require('path');
const express = require('express');
const router = express.Router();


router.get('/',(req,res,next)=> {
    res.sendFile(path.join(__dirname,'../', 'views/screen','map.html'))
});

router.get('/',(req,res,next)=> {
    console.log(req.body);
    console.log('Post');
   
});

module.exports = router;