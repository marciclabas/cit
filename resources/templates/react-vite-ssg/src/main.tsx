import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import { RouterProvider, createBrowserRouter } from 'react-router-dom'

const router = createBrowserRouter([{
  path: '*',
  element: <App />
}])

ReactDOM.hydrateRoot(document.getElementById('root')!, <RouterProvider router={router} />)
