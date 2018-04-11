import React from 'react';
import CurrencyIndexItem from './currency_index_item';

const CurrencyIndex = ({ rates }) => {
  const currencies = Object.keys(rates).sort();

  return (
    <ul>
      {
        currencies.map((currency) => (
        <CurrencyIndexItem
          key={currency}
          currency={currency}
          rate={rates[currency]}
        />
      ))
      }
    </ul>
  );
};

export default CurrencyIndex;