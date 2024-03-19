const createLog = async (req, res) => {
    try{
        const log = req.data
        if(!log.action) throw Error('Action must be present')
        if(!log.taken_by) throw Error('Id of user who took the action must be present')
    } catch (e) {
        return res.json({msg: e.message})
    }
}

const getFilteredLogs = async (req, res) => {

}