const BASE_URL = "http://localhost:3000/api/v1";

 export const Session = {
  create(params) {
    return fetch(`${BASE_URL}/session`, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(params)
    }).then(res => {
      return res.json();
    });
  },
}

 export const Auction = {
  all() {
    return fetch(`${BASE_URL}/auction`, {
      credentials: 'include',
    }).then(res => res.json());
  },

   one(id) {
    return fetch(`${BASE_URL}/auction/${id}`, {
      credentials: 'include',
    }).then(res => res.json());
  },

   create(params) {
    return fetch(`${BASE_URL}/auction`, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({auction: params}),
    }).then(res => res.json());
  },
}

export const User = {
  current() {
    return fetch(`${BASE_URL}/users/current`, {
      method: 'GET',
      credentials: 'include'
    }).then(res => res.json());
  },

   create(params) {
    return fetch(`${BASE_URL}/users`, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({user: params}),
    }).then(res => res.json());
  },
}; 