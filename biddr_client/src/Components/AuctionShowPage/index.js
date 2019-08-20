import React, { Component } from 'react';

import AuctionDetails from '../AuctionDetails';
import BidList from '../BidList';

import { Auction } from '../../api';

export default class AuctionShowPage extends Component {
  constructor(props) {

    // When using constructor in a class-based component
    // you must always call the `Component` class's constructor
    // with super(props);
    super(props);

    this.state = {
      auctionsData: {
        bids: []
      },
      red: false,
    }
  }
  componentDidMount() {
    console.log('props from this component');
    console.log(this,  this.props);
    Auction.one(this.props.match.params.id).then(auction => {
      this.setState({
        auctionsData: auction,
      });
    });
  }


  selfDestruct() {
    this.setState({
      auctionsData: null,
    });
  }

  deleteAnswer(id) {
    this.setState({
      questionData: {
        ...this.state.questionData,
        answers: this.state.questionData.answers.filter(a => a.id !== id)
      }
    })
  }

  render() {
    if(!this.state.questionData) {
      return(
        <main className='page'>
          <h2>Question Does not exist!</h2>
        </main>
      );
    }
    return (
      <main style={this.state.red ? {color: 'red'} : {color: 'purple'}}>
        <AuctionDetails
          title={this.state.questionData.title} 
          body={this.state.questionData.body}
          viewCount={this.state.questionData.view_count}
          createdAt={this.state.questionData.created_at}
          author={this.state.questionData.author}
        />
        <BidList
          answers={this.state.questionData.answers}
          onAnswerDeleteClick={(id) => {this.deleteAnswer(id)}}
        />
        
        <button onClick={() => {this.selfDestruct()}}>
          Self Destruct
        </button>
      </main>
    );
  }
}

