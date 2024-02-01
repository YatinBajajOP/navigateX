import { useState, useRef, useContext } from 'react'
import { RiArrowDropDownLine } from 'react-icons/ri'
import './Accordian.css'
import { createContext } from 'react'
import { useEffect } from 'react'

const AccordianContext = createContext()

const Accordian = ({ children }) => {
  const [activeIndex, setActiveIndex] = useState(null);

  const handleItemClick = (index) => {
    setActiveIndex(prevIndex => prevIndex === index ? null : index);
  };

  return (
    <AccordianContext.Provider value={{ activeIndex, handleItemClick }}>
        {children}
    </AccordianContext.Provider>
  )
}

const useAccordianContext = () => {
  if(!AccordianContext) console.log('Please use these components with the Accordian Component')
  return useContext(AccordianContext)
}

const AccordianHeader = ({ children, index }) => {
  const { activeIndex, handleItemClick } = useAccordianContext()
  return (
    <button className={`${activeIndex === index ? 'active' : ''}`} onClick={() => handleItemClick(index)} >
      {children}
      <RiArrowDropDownLine className={`arrow ${activeIndex === index ? 'active' : ''}`} />
    </button>
  )
}

const AccordianContent = ({ children, index }) => {
  const contentHeight = useRef()
  const { activeIndex } = useAccordianContext()
  return (
    <div ref={contentHeight} className="accordian-item-answer" style={
      activeIndex === index
        ? { height: contentHeight.current.scrollHeight }
        : { height: "0px" }
    }>
      {children}
    </div>
  )
}

Accordian.AccordianHeader = AccordianHeader
Accordian.AccordianContent = AccordianContent
export default Accordian