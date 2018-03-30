import React from "react";
import ReactDOM from 'react-dom';



class PokemonDetail extends React.Component {
  constructor(props){
    super(props);

  }



  componentDidMount(){
    this.props.requestOnePokemon(this.props.match.params.id);
  }

  componentWillReceiveProps(newProps) {
    if(newProps.match.params.id !== this.props.match.params.id) {
      this.props.requestOnePokemon(newProps.match.params.id);
    }
  }


  render() {
    const { id, name, imageUrl, pokeType, attack, defense, moves} = this.props.pokemon;
    let items = Object.values(this.props.items)


    return (

      <div className="pokemon-detail">
        <figure>
          <img src={imageUrl} />
        </figure>
        <h1>{name}</h1>
        <ul>
          <li>Type: {pokeType}</li>
          <li>Attack: {attack}</li>
          <li>Defense: {defense}</li>
          <li>Moves: {moves}</li>
        </ul>

        <section>
          <ul className="items-list">
          {items.map( item =>(
            <li><img src={item.imageUrl}></img></li>
          ))}
        </ul>
        </section>
      </div>
    );
  }
}

export default PokemonDetail;
