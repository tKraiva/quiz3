import React from 'react';
import BidDetails from '../BidDetails';

 export default function BidList(props) {
  const { bids } = props;

   return(
    <ul
      style={{
        listStyle: 'none',
        paddingLeft: 0,
      }}
    >
      {bids.map((bid) => {
        return(
          <li key={bid.id}>
            <BidDetails
              bid_amt={bid.bid_amt}
              author={bid.author}
              createdAt={bid.createdAt}
            />
          </li>
        )
      })}
    </ul>
  )
} 