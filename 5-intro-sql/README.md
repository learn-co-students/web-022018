# Intro to SQL

1. Install the SQLite Browser if you haven't already [here](http://sqlitebrowser.org/)
2. Open the SQLite Browser and click 'File -> Open DataBase'
3. Choose the `chinook.db` file from this repo. This database is open source and maintained by Microsoft (SQL is no fun if you don't have any data)
4. Click the tab that says 'Execute SQL'. Type SQL queries in the box above. Press the play button. See the results of that query in the box below

## What is SQL?

Structured Query Language

## What is sql for?

Database manipulation
information storage
information persistence
Memory
Want stuff to stick around after the program ends
Database

_Sharing Information_ - server that multiple people can access

Storing RELATIONSHIPS

## What kinds of operations can we do in SQL?

(create table, alter table)

Create Data
INSERT
Read data
SELECT
Update
UPDATE
Delete
DELETE

## Analysis

COUNT
Note: Defaults to adding up all of the values in a column in our results

## Challenges

1. Write the SQL to return all of the rows in the artists table?

```SQL
SELECT * FROM artists;
```

2. Write the SQL to select the artist with the name "Black Sabbath"

```SQL
SELECT * FROM artists WHERE name = 'Black Sabbath';
```

3. Write the SQL to create a table named 'fans' with an autoincrementing ID that's a primary key and a name field of type text

```sql
CREATE TABLE fans (id INTEGER PRIMARY KEY, name TEXT,);
```

4. Write the SQL to alter the fans table to have a artist_id column type integer?

```sql
ALTER TABLE fans ADD COLUMN  artist_id INTEGER;
```

5. Write the SQL to add yourself as a fan of the Black Eyed Peas? ArtistId **169**

```sql
INSERT INTO fans (name, artist_id) VALUES ("Prince", 3);
```

6. Write the SQL to return fans that are not fans of the black eyed peas.

```sql
SELECT * FROM fans WHERE artist_id != 169;
```

8. Write the SQL to display an artists name next to their album title

```sql
SELECT name, title FROM ARTISTS
JOIN albums
ON albums.ArtistId = artists.ArtistId;
```

9. Write the SQL to display artist name, album name and number of tracks on that album

```sql
SELECT artists.name as artist, COUNT(tracks.name) as track_count, title as album_title FROM artists
JOIN albums
ON albums.ArtistId = artists.ArtistId
JOIN tracks
ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.AlbumId;
```

10. Write the SQL to return the name of all of the artists in the 'Pop' Genre

### Planning

Step by step!
Explore the data!
Build up the query!
-- artists have their own artistId
-- albums have a artistId
-- tracks have a albumId
-- tracks have a genreId
-- One of the genres is Pop

```sql
SELECT DISTINCT artists.name FROM artists
JOIN albums
ON albums.ArtistId = artists.ArtistId
JOIN tracks
ON tracks.AlbumId = albums.AlbumId
JOIN genres
ON tracks.GenreId = genres.GenreId
WHERE genres.Name = "Pop";
```

## BONUS (very hard)

12. I want to return the names of the artists and their number of rock tracks
    who play Rock music
    and have move than 30 tracks
    in order of the number of rock tracks that they have
    from greatest to least

```sql
-- ???
```

## Double Bonus

13. Check out the [Faker gem](https://github.com/stympy/faker). `gem install faker`, open up irb, run `require 'faker'` and then generate a fake name for yourself using `Faker::Name.name`. How would you update your name in the fans table to be your new name?

```sql

```
