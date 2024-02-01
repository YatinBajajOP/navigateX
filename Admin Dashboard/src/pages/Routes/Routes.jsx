import Accordian from "../../components/Accordion/Accordian"
import Navbar from "../../components/Navbar/Navbar"
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
    <>
      <Navbar />
      <div className="routes_wrapper">
        <Accordian >
          {routes.map((route, index) => (
            <div className="accordian-item" key={route.id}>
              <Accordian.AccordianHeader index={index}>
                <div>
                  
                </div>
              </Accordian.AccordianHeader>
              <Accordian.AccordianContent index={index}>
                {route.answer}
              </Accordian.AccordianContent>
            </div>
          ))}
        </Accordian>
      </div>
    </>
  )
}

export default Routes