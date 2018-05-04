import React from 'react';
import SnackList from './SnackList'


export default class AllSnacks extends React.Component {
  
  render(){
    return <SnackList { ...this.props } url="http://localhost:3000/snacks" />
  }
}