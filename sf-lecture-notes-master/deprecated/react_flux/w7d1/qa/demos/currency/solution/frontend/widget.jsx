"use strict";

const React = require("react");
const Currency = require("./currency.jsx");

const Widget = React.createClass({
  currencies: ["CNY", "GBP", "JPY", "CAD", "EUR", "USD"],

  getInitialState() {
    return ({baseCurrency: "please select", rates: {}});
  },

  updateBaseCurrency(currency) {
    this.setState({baseCurrency: currency}, this.fetchRates);
  },

  fetchRates() {
    $.ajax({
      url: `http://api.fixer.io/latest?base=${this.state.baseCurrency}`,
      type: "GET",
      dataType: "JSON",
      success: function(resp) {
        this.setState({rates: resp.rates});
      }.bind(this)
    })
  },

  render() {
    const currencyOptions = this.currencies.map( (currency) => {
      return (<div key={currency}
                   onClick={this.updateBaseCurrency.bind(this, currency)}
                   className="currency-single">{currency}</div>);
    });

    const currencyNames = Object.keys(this.state.rates);
    const currencyComps = currencyNames.map( (name) => {
      return (<Currency name={name} rate={this.state.rates[name]} key={name}/>);
    });

    return (
      <div>
        <h1>Currency Exchange Rates</h1>
        <h3>Base Currency: {this.state.baseCurrency}</h3>
        <div className="currency-options">
          Get Rates: {currencyOptions}
        </div>
        {currencyComps}
      </div>
    );
  }
});

module.exports = Widget;
