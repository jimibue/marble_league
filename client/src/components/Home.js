import React, { useState, useEffect } from "react";
import { Header } from "semantic-ui-react";
import Axios from "axios";
import League from "./League";

const Home = () => {
  const [leagues, setLeagues] = useState([]);
  useEffect(() => {
    console.log("here");
    Axios.get("/api/leagues")
      .then((res) => {
        // console.log(leagues);
        console.log(res.data);
        console.log("here");
        setLeagues(res.data);
      })
      .catch((e) => console.log(e));
  }, []);
  return (
    <Header as="h3" textAlign="center">
      <h1>Leagues</h1>
      {leagues.map((l) => (
        <League {...l} />
      ))}
    </Header>
  );
};

export default Home;
