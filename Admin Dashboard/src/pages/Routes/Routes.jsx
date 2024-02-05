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
          {routes.map((route, index) => (
            <div className="accordian-item" key={route.id}>
              <Accordian.AccordianHeader index={index}>
              <div className="route-card-header-wrapper">
                  <div className="route-card-header-data">
                    <p>{route.id}</p>
                    <p>{route.name}</p>
                    <p>{route.vehicle.number}</p>
                    <p>{route.vehicle.seats} seater</p>
                    <p>{route.vehicle.vendor}</p>
                  </div>
                  <div className="route-card-header-buttons">
                    <div>&#128393;</div>
                    <div>&#128465;</div>
                  </div>
                </div>
              </Accordian.AccordianHeader>
              <Accordian.AccordianContent index={index}>
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

              </Accordian.AccordianContent>
            </div>
          ))}
        </Accordian>
      </div>
  )
}

export default Routes