
export const FetchDateFact = function(success){
  $.get('http://numbersapi.com/random/year', success);
};
