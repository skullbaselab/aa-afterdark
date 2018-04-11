import React from 'react';

const CurrencyIndexItem = ({ currency, rate }) => {
  const color = rate > 1 ? "green" : "red";
  return (
    <li className={color}>
      {currency}: {rate}
    </li>
  );
};

export default CurrencyIndexItem;