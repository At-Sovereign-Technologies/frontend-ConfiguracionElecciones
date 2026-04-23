import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom"
import ParametrosBase from "./pages/ParametrosBase"
import MetodoElectoralReglas from "./pages/MetodoElectoralReglas"
import CircunscripcionesElegibilidad from "./pages/CircunscripcionesElegibilidad"

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Navigate to="/configuracion/parametros-base" replace />} />
        <Route path="/configuracion/parametros-base" element={<ParametrosBase />} />
        <Route path="/configuracion/metodo-electoral" element={<MetodoElectoralReglas />} />
        <Route path="/configuracion/circunscripciones" element={<CircunscripcionesElegibilidad />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
