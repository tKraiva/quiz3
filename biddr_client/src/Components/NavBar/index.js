
import React from 'react';
import { Link } from 'react-router-dom';

 export default function NavBar() {
  return(
    <div>
      <Link to="/">HomePage</Link>
      |
      <Link to="/auctions">Auctions</Link>
      |
      <Link to="/sign_up">Sign Up</Link>

    </div>
  )  
} 