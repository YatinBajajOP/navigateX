import Accordian from "../../components/Accordion/Accordian"
import { useSelector } from "react-redux"
import './Logs.css'
import { useDispatch } from "react-redux"
import { useEffect } from "react"
import { GET_LOGS } from '../../redux/LogStore/LogStore.thunk';

const Logs = () => {
  const logs = useSelector((state) => state.logs.logs)
  const dispatch = useDispatch()
  useEffect(() => {
    dispatch(GET_LOGS())
  }, [])
  return (
      <div className="routes_wrapper">
        <Accordian >
          {logs.map((log, index) => (
            <div className="accordian-item" key={log.id}>
              <Accordian.AccordianHeader index={index}>
              <div className="route-card-header-wrapper">
                  <div className="route-card-header-data">
                    <p>{log.action}</p>
                    <p>{log.taken_by?.display_name}</p>
                    <p>{log.target?.display_name}</p>
                    <p>{new Date(log.timestamp).toString()}</p>
                  </div>
                  <div className="route-card-header-buttons">
                    <div>&#128393;</div>
                    <div>&#128465;</div>
                  </div>
                </div>
              </Accordian.AccordianHeader>
              {/* <Accordian.AccordianContent index={index}>
                <div className="route-card-content-wrapper">
                  <div className="route-card-content-data">
                    <p>{route.employee.display_name}</p>
                    <p>{route.address}</p>
                    <p>{new Date(route.eta).toString()}</p>
                  </div>
                  <div className="route-card-content-buttons">
                    <div>&#128465;</div>
                    <div>&#10021;</div>
                  </div>
                </div>
              </Accordian.AccordianContent> */}
            </div>
          ))}
        </Accordian>
      </div>
  )
}

export default Logs