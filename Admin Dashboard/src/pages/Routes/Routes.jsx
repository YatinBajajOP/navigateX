import { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import Accordian from "../../components/Accordion/Accordian";
import { GET_ROUTES } from "../../redux/RouteStore/RouteStore.thunk";
import { deleteRoute, deleteUserFromRoute } from "../../firebase/firestore/routes";
import "./Routes.css";

const Routes = () => {
  const routes = useSelector((state) => state.routes.routes);
  const [modalOpen, setModalOpen] = useState(null);
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(GET_ROUTES());
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault()
    const form = e.target
    const file = form.file.files[0]
    const reader = new FileReader()
    reader.addEventListener('load', (e) => { console.log(e.target.result) });
    reader.readAsText(file)
  }

  return (
    <>
      <div className="route-modal-btn">
        <div className="routes-import-btn" onClick={() => setModalOpen('import')}>
          Import Routes
        </div>
        <div className="add-route-btn" onClick={() => setModalOpen('add')}>Add Routes
        </div>
      </div>
      <div className="routes_wrapper">
        <Accordian>
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
                    <div onClick={deleteRoute}>&#128465;</div>
                  </div>
                </div>
              </Accordian.AccordianHeader>
              <Accordian.AccordianContent index={index}>
                {routes[route].map((employee) => (
                  <div className="route-card-content-wrapper" key={employee.id}>
                    <div className="route-card-content-data">
                      <p>{employee?.employee.display_name}</p>
                      <p>{employee?.employee.address}</p>
                      <p>{new Date(employee?.eta).toLocaleString()}</p>
                    </div>
                    <div className="route-card-content-buttons">
                      <div onClick={deleteUserFromRoute}>&#128465;</div>
                      <div>&#10021;</div>
                    </div>
                  </div>
                ))}
              </Accordian.AccordianContent>
            </div>
          ))}
        </Accordian>
      </div>
      {modalOpen
        ? modalOpen === 'import'
          ? (
            <div className="routes-import-modal">
              <form onSubmit={handleSubmit}>
                <div className="form-close-btn" onClick={() => setModalOpen(false)} >X</div>
                <input type="file" id='routes-file-input' style={{ display: 'none' }} name='file' />
                <label htmlFor="routes-file-input" style={{ width: '80%', border: '1px dashed black', display: 'grid', placeItems: 'center', height: '80%', margin: 'auto' }} >Click here to import file</label>
                <button>Submit</button>
              </form>
            </div>
          )
          : (
            <div className="routes-add-modal">
              <form onSubmit={handleSubmit}>
                <div className="form-close-btn" onClick={() => setModalOpen(false)} >X</div>
                <div className="add-form">
                  <input type="text" id="name" name="driver-name" placeholder="Enter Driver Name"></input>
                  <input type="text" id="cab-no" name="cab-number" placeholder="Enter Cab Number"></input>
                  <input type="text" id="vendor" name="vendor" placeholder="Enter Vendor Name"></input>
                  <button>Submit</button>
                </div>
              </form>
            </div>
          )
        : null}
    </>
  );
};

export default Routes;
