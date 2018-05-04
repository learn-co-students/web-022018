import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import LoginForm from './components/LoginForm'
import RegisterForm from './components/RegisterForm'
import { Route, Link } from 'react-router-dom';
import AllSnacks from './components/AllSnacks'
import MySnacks from './components/MySnacks'
import Logout from './components/Logout'

class App extends Component {

  state = {
    
  }

  componentDidMount() {
    if (localStorage.auth) {
      const auth = JSON.parse(localStorage.auth)
      this.setState({ auth });
    }
  }

  authFetched = (auth) =>{
    localStorage.auth = JSON.stringify(auth);
    this.setState({ auth });
  }

  logout = () => {
    localStorage.removeItem("auth")
    this.setState({ auth: null })
  }

  authyBits(){
    if (this.state.auth) {
      return (<div>
          <Route path="/snacks" render={ (renderProps) => {
              return <AllSnacks auth={ this.state.auth } />
            }
          } />
          <Route path="/my-snacks" render={ (renderProps) => {
              return <MySnacks auth={ this.state.auth } />
            }
          } />
          <Route path="/logout" render={ (renderProps) => {
              return <Logout logout={ this.logout } />
            }
          } />
        </div>)
    }
    else {
      return ""
    }
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>

          { this.state.auth ? 
            <div>
              <Link to="/snacks">Snacks</Link>
              <Link to="/my-snacks">My Snacks</Link>
              <Link to="/logout">Log out</Link>
            </div>
            : 
            <div>
              <Link to="/register">Register</Link>
              <Link to="/login">Login</Link>
            </div>
          }
        </header>
        <Route path="/register" render={ (renderProps) => 
          <RegisterForm history={ renderProps.history } authSet={ this.authFetched } /> 
        } />
        <Route path="/login" render={ (renderProps) =>
          <LoginForm history={ renderProps.history } authSet={ this.authFetched } />
        } />
        { this.authyBits() }
      </div>
    );
  }
}

export default App;
