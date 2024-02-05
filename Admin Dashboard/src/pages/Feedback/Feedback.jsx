import Accordian from "../../components/Accordion/Accordian"
import { useSelector } from "react-redux"
import './Feedback.css'
import { useDispatch } from "react-redux"
import { useEffect } from "react"
import { GET_FEEDBACKS } from "../../redux/FeedbackStore/FeedbackStore.thunk";

const Feedback = () => {
  const feedbacks = useSelector((state) => state.feedbacks.feedbacks)
  const dispatch = useDispatch()
  useEffect(() => {
    dispatch(GET_FEEDBACKS())
  }, [])
  return (
    <div className="routes_wrapper">
      <Accordian >
        {feedbacks.map((feedback, index) => (
          <div className="accordian-item" key={feedback.id}>
            <Accordian.AccordianHeader index={index}>
              <div className="route-card-header-wrapper">
                <div className="route-card-header-data">
                  <p>{feedback?.id}</p>
                  <p>{feedback?.given_by?.display_name}</p>
                  <p>{feedback?.rating} star</p>
                  <p>{feedback?.timestamp}</p>
                </div>
                <div className="route-card-header-buttons">
                  <div>&#128393;</div>
                  <div>&#128465;</div>
                </div>
              </div>
            </Accordian.AccordianHeader>
            {
              feedback.feedback
                ? (<Accordian.AccordianContent index={index}>
                  <div className="route-card-content-wrapper">
                    <div className="route-card-content-data">
                      <p>{feedback?.feedback}</p>
                    </div>
                  </div>
                </Accordian.AccordianContent>)
                : null
            }
          </div>
        ))}
      </Accordian>
    </div>
  )
}

export default Feedback