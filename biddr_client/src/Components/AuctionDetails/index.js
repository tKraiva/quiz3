import React from 'react';
import {DifferenceInDays} from '../../helpers';

 export default function AuctionDetails(props) {
  const { title, description, createdAt, author } = props;
  return (
    <div>
      <h2>{title}</h2>
      <p>
        {description} <br />
        By {author ? author.full_name : 'anonymous'}
      </p>
     
      <p>
        <small> Listed  {DifferenceInDays(new Date().toLocaleDateString(), createdAt)} days ago</small>
      </p>
    </div>
  );
}