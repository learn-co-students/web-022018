import React from 'react';

export default class SnackList extends React.Component {

  state = {
    snacks: []
  }

  componentDidMount(){
    if (!this.state.snacks.length) this.getSnacks();
  }

  componentDidUpdate(){
    if (!this.state.snacks.length) this.getSnacks();
  }

  getSnacks() {
    if (!this.props.auth) {
      return
    }
    fetch(this.props.url, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/javascript",
        "Authorization": `Token token=${ this.props.auth.token }`
      }
    }).then(res => res.json()).then(data => this.setState({ snacks: data }))
  }

  render(){
    return <ol>
      { this.state.snacks.map(snack => <li key={ snack.id }>{ snack.name }</li>)}
    </ol>
  }
}