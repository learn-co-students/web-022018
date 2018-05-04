import React from 'react'
import AuthForm from './AuthForm'

export default class LoginForm extends React.Component {

  render(){
    return <AuthForm { ...this.props } 
                     url="http://localhost:3000/sessions" />
  }
}
