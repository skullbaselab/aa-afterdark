import React from 'react';
import AuthButton from './auth/auth_button';

export default function App({ children }) {
  return (
    <main>
      <AuthButton />
      { children }
    </main>
  )
}
