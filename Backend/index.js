const express = require('express')
const app = express()
const PORT = process.env.PORT || 5000
const UserRoute = require('./Routes/UserRoute')

app.use(require('cors')())
app.use(express.urlencoded({ extended: true }));
app.use(express.json())

app.use('/api/users', UserRoute)

app.use((req, res, next) => {
    // if(next) next()
    console.log(`${new Date().toLocaleTimeString()} ${req.path} ${req.method} ${res.statusCode}`)
})

app.listen(PORT, () => {
    console.log(`server is running on port ${PORT}`)
})