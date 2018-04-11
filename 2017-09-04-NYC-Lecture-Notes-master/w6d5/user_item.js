import React from 'react';

const UserItem = ({ user, selected, selectMe }) => {
  console.log("UserItem rendering");
  return (
    <section onClick={selectMe}>
      <h3>{user.name}</h3>
      <span>Age: {user.age}</span>
      <p>{selected && user.about}</p>
    </section>
  );
};

export default UserItem;
