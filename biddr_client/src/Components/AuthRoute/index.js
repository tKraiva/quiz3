import React from 'react';
import { Route, Redirect } from 'react-router-dom';

 export default function AuthRoute(props) {
  // deconstrut isAuthenticated from props;
  // deconstruct component and rename it  to Component from props;
  // deconstruct everything else and place it in routeProps;
  const { isAuthenticated, component: Component, ...routeProps } = props;
  console.log(isAuthenticated);
  if(!isAuthenticated) {
    return <Redirect to='/sign_in'/>;
  } else {
    return <Route {...routeProps} component={Component} />
  }
}