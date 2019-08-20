import React from 'react';
import {DifferenceInDays} from '../../helpers';
// A React component is a function that returns a React element.
// React elements are created with the `React.createElement()` method
// or JSX tags.

  // Your React component's names must be in PascalCase. Those whose
// names do not begin with an upper case letter will interpreted
// as plain HTML tag.
export default function BidDetails(props) {
  const { bid_amt, author, createdAt } = props;
  console.log(author);
  return (
    <div>
      <p>
        {bid_amt} By { author.full_name } <br />
        <small>Bidded {DifferenceInDays(null, createdAt)} days ago</small>
      </p>
    </div>
  );
}