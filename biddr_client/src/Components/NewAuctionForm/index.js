import React from 'react';

 export default function NewAuctionForm(props) {
    return(
      <form onSubmit={(params) => { props.onCreateQuestion({title: 'title', description:'description'}) }}>
        <input type="submit"/>
      </form>
    );
} 
