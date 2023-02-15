const express = require('express');

const PORT = 8080;
const message = (process.env.MESSAGE) ? process.env.MESSAGE : 'Nothing important'; 

const app = express();

app.get('/', (req, res) => {
    console.log(req);
    res.send(`This is my message: ${message}`);
});

app.listen(PORT, () => console.log(`Running on ${PORT}`));
