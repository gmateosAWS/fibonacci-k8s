import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import Fib from './Fib';
import OtherPage from './OtherPage';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className='App-title'>Fibonacci Calculator running on KUBERNETES</h1>
          <Link to="/">Home</Link>&nbsp;
          <Link to="/otherpage">Other page</Link>
        </header>
        <div>
          <Route exact path ="/" component={Fib}></Route>
          <Route path ="/otherpage" component={OtherPage}></Route>
        </div>
      </div>
    </Router>
  );
}

export default App;
