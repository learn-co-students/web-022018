import React from 'react';
import SnackList from './SnackList'


export default class MySnacks extends React.Component {


  render(){
    return <SnackList { ...this.props } url={ `http://localhost:3000/users/${ this.props.auth.user_id }/snacks` } />
  }
}