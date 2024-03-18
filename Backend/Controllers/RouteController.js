const ROUTES = require('../Models/RouteModel')
const USERS = require('../Models/UserModel')
const VEHICLES = require('../Models/VehicleModel')

const createRoute = async (req, res) => {
    const route = req.body
    try {
        if(!route._id) throw Error('Please provide a route id')
        if(!route.shift) throw Error('Please provide the shift for this route')
        if(!route.d_id) throw Error('Please provide the ID of the driver who will be taking this shift')
        if(!route.employees) throw Error('please provide a list of employees in this shift')
        if(!route.v_id) throw Error('Please provide the vehicle ID of the car used in this shift')
    
        const driver = await USERS.findById(route.d_id)
        if(!driver) throw Error(`Driver with id ${route.d_id} does not exist`)
    
        const vehicle = await VEHICLES.findById(route.v_id)
        if (!vehicle) throw Error(`Vehicle with the id "${route.v_id}" does not exist`)
    
        Promise.all(route.employees.map(async employee => {
            const user = await USERS.findById(employee.id)
            if(!user) throw Error(`Employee with id ${employee.id} does not exist`)
        }))
    
        const newRoute = ROUTES.create(route);
        return res.json({msg: 'success', data: newRoute._id});
    } catch (err) {
        return res.status(400).json({ msg: err.message });
    }
}