import React from 'react'
import AuthForm from './AuthForm'


export default class RegisterForm extends React.Component {

  render(){
    return <AuthForm { ...this.props } url="http://localhost:3000/users" />
  }

}
