import React from 'react';
import { Session } from '../../api';

 export default function SignInPage() {
  function handleSubmit(event) {
    event.preventDefault();
    const { currentTarget } = event;
    const data = new FormData(currentTarget);
    Session.create({
      email: data.get('email'),
      password: data.get('password'),
    });
  }

   return(
    <main className='page'>
      <h1>Sign In</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor='email'>Email</label>
          <input type='email' name='email'></input>
        </div>
        <div>
          <label htmlFor='password'>Password</label>
          <input type='password' name='password'></input>
        </div>
        <input type='submit' value='Sign In'/>
      </form>
    </main>
  );
} 