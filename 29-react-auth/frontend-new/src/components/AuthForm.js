import React from 'react'

export default class AuthForm extends React.Component {

  DEFAULT_STATE = {
    username: "",
    password: "",
    errors: []
  }
  state = this.DEFAULT_STATE

  handleSubmit = (event) => {
    event.preventDefault();
    const { username, password } = this.state;
    const auth = { username, password };
    this.doFetch(auth)
  }

  doFetch(auth) {
    fetch(this.props.url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/javascript"
      },
      body: JSON.stringify(auth)
    }).then((resp) => resp.json())
    .then((data) => {
        if (data.errors) {
          this.setState({ errors: data.errors })
        } else {
          this.setState({ ...this.DEFAULT_STATE })
          this.props.authSet(data)
          this.props.history.push("/")
        }
      })
  }

  handleChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value
    })
  }

  errors(){
    return <ol>
        { this.state.errors.map((error) => <li>{ error }</li>) }
    </ol>
  }

  render(){
    return (<div>
      { this.state.errors.length ? this.errors() : "" }
      <form onSubmit={ this.handleSubmit }>
        <label htmlFor="username">Username</label>
        <input type="text" onChange={ this.handleChange } 
                           value={ this.state.username }
                           name="username"
                           id="username" />
        <label htmlFor="password">Password</label>
        <input type="password" onChange={ this.handleChange } 
                           value={ this.state.password }
                           name="password"
                           id="password" />
        <input type="submit" />
      </form>
    </div>)
  }

}
