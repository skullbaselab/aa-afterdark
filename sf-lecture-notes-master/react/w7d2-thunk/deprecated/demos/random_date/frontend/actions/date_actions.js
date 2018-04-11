export const DATE_CONSTANTS = {
  REQUEST_DATE_FACT: "REQUEST_DATE_FACT",
  RECEIVE_DATE_FACT: "RECEIVE_DATE_FACT"
};

export const requestDate = () => ({
  type: DATE_CONSTANTS.REQUEST_DATE_FACT
});

export const receiveDateFact = fact => ({
  type: DATE_CONSTANTS.RECEIVE_DATE_FACT,
  fact
});
