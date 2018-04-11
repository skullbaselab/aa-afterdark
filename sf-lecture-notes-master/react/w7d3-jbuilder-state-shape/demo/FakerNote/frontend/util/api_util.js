export const fetchUsers = function (success) {
  $.ajax({
    method: 'GET',
    url: 'api/users',
    success
  });
};

export const fetchNotebooks = function (userId, success) {
  $.ajax({
    method: 'GET',
    url: `api/users/${userId}/notebooks`,
    success
  });
};

window.fetchUsers = fetchUsers;
