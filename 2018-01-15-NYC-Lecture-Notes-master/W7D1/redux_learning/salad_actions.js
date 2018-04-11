export const MAKE_SALAD = 'MAKE_SALAD';

export const makeSalad = function(salad) {
  return {
    type: MAKE_SALAD,
    // burger: burger
    salad
  };
};
