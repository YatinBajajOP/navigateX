const express = require('express')
const app = express()
const PORT = process.env.PORT || 5000
const UserRoute = require('./Routes/UserRoute')
const AuthRoute = require('./Routes/AuthRoute')
const mongoose = require('mongoose')
require('dotenv').config();

app.use(require('cors')())
app.use(express.urlencoded({ extended: true }));
app.use(express.json())
mongoose.connect(process.env.MONGO_URI)
.then(() => console.log('Connected to MongoDB'))
.catch((err) => console.error('Failed to connect to MongoDB', err));

app.use((req, res, next) => {
    console.log(`${new Date().toLocaleTimeString()} ${req.path} ${req.method} ${res.statusCode}`)
    if(next) next()
})

app.use('/api/users', UserRoute)
app.use('/api/auth', AuthRoute)

app.listen(PORT, () => {
    console.log(`server is running on port ${PORT}`)
})