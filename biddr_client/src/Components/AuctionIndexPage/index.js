import React, {Component} from 'react';

import { Link } from 'react-router-dom';
import { Auction } from '../../api';
import NewAuctionForm from '../NewAuctionForm';

 export default class  AuctionIndexPage extends Component {
    constructor(props) {
        super(props);
    
        this.state = {
          auctions: [],
        };
      }
    

   componentDidMount() {
    Auction.all().then(auctions => {
      this.setState({
        auctions: auctions,
      });
    });
  }

    
      createAuction(params) {
        this.setState({
            auctions: [...this.state.auctions, params]
        });
      }
    
      render() {
        return(
          <main className='page'>
            <h2>Auctions Index</h2>
            <ul>
              {this.state.auctions.map((auction) => {
                const { id, title } = auction;
                return(
                  <li 
                    key={id}
                    style={{listStyle: 'none'}}
                  >
                     <Link to={`/questions/${id}`}>
                      {title}
                      </Link>
                  </li>
                )
              })}
            </ul>
            <NewAuctionForm onCreateAuctions={(params) => {this.createAuctions(params)}}/>
          </main>
        );
      }
    }
    