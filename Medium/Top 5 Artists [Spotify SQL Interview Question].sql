/*Assume there are three Spotify tables: artists, songs, and global_song_rank, which contain information about the artists, songs, and music charts, respectively.

Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. 
Display the top 5 artist names in ascending order, along with their song appearance ranking.

Assumptions:

If two or more artists have the same number of song appearances, they should be assigned the same ranking, 
and the rank numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5).
For instance, if both Ed Sheeran and Bad Bunny appear in the Top 10 five times, they should both be ranked 1st and the next artist should be ranked 2nd.*/

# solution
WITH global_ranking as (
  SELECT
    a.artist_name,
    COUNT(gs.song_id) as no_of_songs,
    DENSE_RANK() OVER(ORDER BY count(gs.song_id) DESC) as rnk
  FROM
    artists a  
  INNER JOIN songs s  
  ON a.artist_id = s.artist_id
  INNER JOIN global_song_rank gs 
  ON s.song_id = gs.song_id
  WHERE gs.rank <= 10
  GROUP BY a.artist_name)

SELECT
  artist_name,
  rnk as artist_rank
FROM
  global_ranking
WHERE rnk <= 5;
