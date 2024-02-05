import { BrowserRouter } from 'react-router-dom'
import RootRouter from './routers/RootRouter'
import Navbar from './components/Navbar/Navbar'

function App() {
  return (
    <BrowserRouter>
      <Navbar />
      <RootRouter />
    </BrowserRouter>
  )
}

export default App