import React from 'react';
import CurrencyIndex from './currency_index';

class Widget extends React.Component {

  constructor() {
    super();
    this.state = {
      baseCurrency: "",
      rates: {}
    };

    this.optionOne = this.optionOne.bind(this);
  }

  optionOne(e) {
    this.setState({ baseCurrency: e.currentTarget.innerText }, this.fetchConversionRates);
  }

  optionTwo(baseCurrency) {
    this.setState({ baseCurrency }, this.fetchConversionRates);
  }

  optionThree(baseCurrency) {
    return () => {
      this.setState({ baseCurrency }, this.fetchConversionRates);
    };
  }

  fetchConversionRates() {
    $.ajax({
      url: `http://api.fixer.io/latest?base=${this.state.baseCurrency}`,
      method: 'GET'
    }).then((result) => {
      this.setState({ rates: result.rates });
    });
  }

  render() {
    return (
      <div>
        <h1>Super Awesome Currency Info Machine</h1>
        <button onClick={this.optionOne}>USD</button>
        <button onClick={() => this.optionTwo("CAD")}>CAD</button>
        <button onClick={this.optionThree("HRK")}>HRK</button>

        <h2>Base Currency: {this.state.baseCurrency}</h2>
        <CurrencyIndex rates={this.state.rates} />
      </div>
    );
  }

}

export default Widget;