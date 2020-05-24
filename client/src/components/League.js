import React, { Component } from "react";

export default class League extends Component {
  render() {
    return (
      <div>
        <h1>{this.props.league_name}</h1>
        {this.props.users.map((user) => {
          return <p>{`${user.name} rank ${user.user_ranking}`}</p>;
        })}
      </div>
    );
  }
}
