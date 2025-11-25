// --- Constraints ---
CREATE CONSTRAINT user_id_unique IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT movie_id_unique IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT series_id_unique IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT genre_name_unique IF NOT EXISTS
FOR (g:Genre) REQUIRE g.name IS UNIQUE;

CREATE CONSTRAINT actor_name_unique IF NOT EXISTS
FOR (a:Actor) REQUIRE a.name IS UNIQUE;

CREATE CONSTRAINT director_name_unique IF NOT EXISTS
FOR (d:Director) REQUIRE d.name IS UNIQUE;

// --- Users ---
CREATE (u1:User {id: "U1", name: "Alice"}),
       (u2:User {id: "U2", name: "Bob"}),
       (u3:User {id: "U3", name: "Carol"}),
       (u4:User {id: "U4", name: "David"}),
       (u5:User {id: "U5", name: "Eve"}),
       (u6:User {id: "U6", name: "Frank"}),
       (u7:User {id: "U7", name: "Grace"}),
       (u8:User {id: "U8", name: "Hector"}),
       (u9:User {id: "U9", name: "Ivy"}),
       (u10:User {id: "U10", name: "Jack"});

// --- Movies ---
CREATE (m1:Movie {id:"M1", title:"Inception", year:2010}),
       (m2:Movie {id:"M2", title:"The Matrix", year:1999}),
       (m3:Movie {id:"M3", title:"Interstellar", year:2014}),
       (m4:Movie {id:"M4", title:"The Godfather", year:1972}),
       (m5:Movie {id:"M5", title:"Avengers", year:2012}),
       (m6:Movie {id:"M6", title:"Pulp Fiction", year:1994}),
       (m7:Movie {id:"M7", title:"Titanic", year:1997}),
       (m8:Movie {id:"M8", title:"Gladiator", year:2000}),
       (m9:Movie {id:"M9", title:"Joker", year:2019}),
       (m10:Movie {id:"M10", title:"Parasite", year:2019});

// --- Series ---
CREATE (s1:Series {id:"S1", title:"Breaking Bad", year:2008}),
       (s2:Series {id:"S2", title:"Stranger Things", year:2016}),
       (s3:Series {id:"S3", title:"Game of Thrones", year:2011}),
       (s4:Series {id:"S4", title:"Friends", year:1994}),
       (s5:Series {id:"S5", title:"The Office", year:2005}),
       (s6:Series {id:"S6", title:"Sherlock", year:2010}),
       (s7:Series {id:"S7", title:"Dark", year:2017}),
       (s8:Series {id:"S8", title:"The Crown", year:2016}),
       (s9:Series {id:"S9", title:"Westworld", year:2016}),
       (s10:Series {id:"S10", title:"Loki", year:2021});

// --- Genres ---
CREATE (g1:Genre {name:"Action"}),
       (g2:Genre {name:"Drama"}),
       (g3:Genre {name:"Sci-Fi"}),
       (g4:Genre {name:"Thriller"}),
       (g5:Genre {name:"Comedy"});

// --- Actors ---
CREATE (a1:Actor {name:"Leonardo DiCaprio"}),
       (a2:Actor {name:"Keanu Reeves"}),
       (a3:Actor {name:"Al Pacino"}),
       (a4:Actor {name:"Robert Downey Jr."}),
       (a5:Actor {name:"Samuel L. Jackson"});

// --- Directors ---
CREATE (d1:Director {name:"Christopher Nolan"}),
       (d2:Director {name:"Quentin Tarantino"}),
       (d3:Director {name:"Steven Spielberg"}),
       (d4:Director {name:"Martin Scorsese"}),
       (d5:Director {name:"James Cameron"});

// --- Relacionamentos Watched ---
MATCH (u:User {id:"U1"}), (m:Movie {id:"M1"}) CREATE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {id:"U2"}), (m:Movie {id:"M2"}) CREATE (u)-[:WATCHED {rating:4}]->(m);
MATCH (u:User {id:"U3"}), (m:Movie {id:"M3"}) CREATE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {id:"U4"}), (s:Series {id:"S1"}) CREATE (u)-[:WATCHED {rating:5}]->(s);
MATCH (u:User {id:"U5"}), (s:Series {id:"S2"}) CREATE (u)-[:WATCHED {rating:4}]->(s);

// --- Relacionamentos IN_GENRE ---
MATCH (m:Movie {id:"M1"}), (g:Genre {name:"Sci-Fi"}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:"M2"}), (g:Genre {name:"Sci-Fi"}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (s:Series {id:"S1"}), (g:Genre {name:"Drama"}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:"S2"}), (g:Genre {name:"Action"}) CREATE (s)-[:IN_GENRE]->(g);

// --- Relacionamentos ACTED_IN ---
MATCH (a:Actor {name:"Leonardo DiCaprio"}), (m:Movie {id:"M1"}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:"Keanu Reeves"}), (m:Movie {id:"M2"}) CREATE (a)-[:ACTED_IN]->(m);

// --- Relacionamentos DIRECTED ---
MATCH (d:Director {name:"Christopher Nolan"}), (m:Movie {id:"M1"}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {name:"Quentin Tarantino"}), (m:Movie {id:"M6"}) CREATE (d)-[:DIRECTED]->(m);
