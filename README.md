Diagrama do Banco:

(User)-[WATCHED {rating}]->(Movie)
(User)-[WATCHED {rating}]->(Series)

(Movie)-[IN_GENRE]->(Genre)
(Series)-[IN_GENRE]->(Genre)

(Actor)-[ACTED_IN]->(Movie)
(Actor)-[ACTED_IN]->(Series)

(Director)-[DIRECTED]->(Movie)
(Director)-[DIRECTED]->(Series)
