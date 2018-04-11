import React from 'react';

export default class AnimalList extends React.Component {
  constructor(props) {
    console.log('AnimalList Constructor');
    super(props);
  }

  componentDidMount() {
    console.log('AnimalList Mounted');
  }

  componentWillUnmount() {
    console.log('AnimalList unmounted');
  }

  render() {
    const animalItems = this.props.animals.map(animal =>
      <li key={ animal.id }>
        <h3 className="centered">{ animal.name }</h3>
        <img src={ animal.photo_url } />
      </li>
    );

    return (
      <ul className="flex-row">
        { animalItems }
      </ul>
    );
  }
}

// export default function AnimalList(props) {
//   console.log("AniamlList Render");
//   const animalItems = props.animals.map(animal =>
//     <li key={ animal.id }>
//       <h3 className="centered">{ animal.name }</h3>
//       <img src={ animal.photo_url } />
//     </li>
//   );
//
//   return (
//     <ul className="flex-row">
//       { animalItems }
//     </ul>
//   );
// }



const LikeCounter = ({ numLikes, handleClick }) => {
  return (
    <div onClick={ handleClick }>
      <div>{ numLikes }</div>
    </div>
  )
};

const LikeCounter = ({ numLikes, handleClick }) => (
  debugger
  <div onClick={ handleClick }>
    <div>{ numLikes }</div>
  </div>
);
