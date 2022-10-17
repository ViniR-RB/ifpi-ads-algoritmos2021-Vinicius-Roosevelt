
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom'
import Home from './modules/home/Home';
import Teams from './modules/teams/Teams';
import './App.css';
import Players from './modules/player/Player';
import Header from './componnets/menu';
import AppRoutes from './modules/Route';
import { Footer } from './componnets/footer';

function App() {


  return (
    <div className='App'>
      <Router>
        <div className='menu'>
          <Header />
        </div>

        <main>
          <AppRoutes />
        </main>

        <Footer />
      </Router>
    </div>
  );
}

export default App
