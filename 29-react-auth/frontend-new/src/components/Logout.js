import React from 'react'

export default class Logout extends React.Component {

  componentDidMount(){
    this.props.logout();
  }

  render(){
    return ""
  }
}
