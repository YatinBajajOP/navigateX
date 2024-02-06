import Accordian from "../../components/Accordion/Accordian"
import { useSelector } from "react-redux"
import './Routes.css'
import { useDispatch } from "react-redux"
import { GET_ROUTES } from '../../redux/RouteStore/RouteStore.thunk';
import { useEffect } from "react"

const Routes = () => {
  const routes = useSelector((state) => state.routes.routes)
  const dispatch = useDispatch()
  useEffect(() => {
    dispatch(GET_ROUTES())
  }, [])
  return (
    <div className="routes_wrapper">
      <Accordian >
        {Object.keys(routes).map((route, index) => (
          <div className="accordian-item" key={route}>
            <Accordian.AccordianHeader index={index}>
              <div className="route-card-header-wrapper">
                <div className="route-card-header-data">
                  <p>{routes[route]?.at(0)?.id}</p>
                  <p>{routes[route]?.at(0)?.driver?.display_name}</p>
                  <p>{routes[route]?.at(0)?.vehicle?.number}</p>
                  <p>{routes[route]?.at(0)?.vehicle?.seats} seater</p>
                  <p>{routes[route]?.at(0)?.vehicle?.vendor}</p>
                </div>
                <div className="route-card-header-buttons">
                  <div>&#128393;</div>
                  <div>&#128465;</div>
                </div>
              </div>
            </Accordian.AccordianHeader>
            <Accordian.AccordianContent index={index}>
              {
                routes[route].map(employee => (
                  <div className="route-card-content-wrapper" key={employee.id}>
                    <div className="route-card-content-data">
                      <p>{employee?.employee.display_name}</p>
                      <p>{employee?.employee.address}</p>
                      <p>{new Date(employee?.eta).toLocaleString()}</p>
                    </div>
                    <div className="route-card-content-buttons">
                      <div>&#128465;</div>
                      <div>&#10021;</div>
                    </div>
                  </div>
                ))
              }
            </Accordian.AccordianContent>
          </div>
        ))}
      </Accordian>
    </div>
  )
}

export default Routes