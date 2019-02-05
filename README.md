https://dev.mysql.com/doc/refman/5.7/en/mysql-commands.html             #URL for mysql command list

BASH:

install Mysql:

mysql-ctl start


mysql -u $C9_USER -p

prompt: enter password      #(just press enter)



download Chinook_MySQL:

wget https://raw.githubusercontent.com/lerocha/chinook-database/master/ChinookDatabase/DataSources/Chinook_MySql_AutoIncrementPKs.sql


to run script and create populated database:

mysql -u $C9_USER -p < Chinook_MySql_AutoIncrementPKs.sql           #(takes a minute to complete) #-u is user
Enter password:                                                     #(press enter)

mysql -u $C9_USER -p       #-p is password                                         #(login to MySql)
>>Enter password:                                                   #(press enter)

mysql>>> show databases;


03-MySql command line:

mysql> use Chinook;             #type use Chinook;

mysql> show tables;             #type show tables;
+-------------------+
| Tables_in_Chinook |
+-------------------+
| Album             |
| Artist            |
| Customer          |
| Employee          |
| Genre             |
| Invoice           |
| InvoiceLine       |
| MediaType         |
| Playlist          |
| PlaylistTrack     |
| Track    


mysql> desc                            #type "desc" and "Genre"(table name) to view properties of the tables 

 Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| GenreId | int(11)      | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(120) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)


log all activity at the MYSQl command line to a text file using "tee" command:
mysql> tee file.txt             #creates file.txt and logs all commands and results

mysql> notee                    #this stops the logging



test.sql:
                        #wrote quick program to count track and artist
type:
mysql> source test.sql

+----------+
| count(*) |
+----------+
|     3503 |
+----------+
1 row in set (0.00 sec)

+----------+
| count(*) |
+----------+
|      275 |
+----------+
1 row in set (0.00 sec)


limit results:
mysql> select * from Album limit 8;

output:
    
    | AlbumId | Title                                 | ArtistId |
+---------+---------------------------------------+----------+
|       1 | For Those About To Rock We Salute You |        1 |
|       2 | Balls to the Wall                     |        2 |
|       3 | Restless and Wild                     |        2 |
|       4 | Let There Be Rock                     |        1 |
|       5 | Big Ones                              |        3 |
+---------+---------------------------------------+----------+
5 rows in set (0.00 sec)


join(in this case Artist and Album tables):
mysql> select Title, Name from Album
    -> join Artist on Album.ArtistId = Artist.ArtistId
    -> limit 5;
    
    output:
+---------------------------------------+-----------+
| Title                                 | Name      |
+---------------------------------------+-----------+
| For Those About To Rock We Salute You | AC/DC     |
| Let There Be Rock                     | AC/DC     |
| Balls to the Wall                     | Accept    |
| Restless and Wild                     | Accept    |
| Big Ones                              | Aerosmith |
+---------------------------------------+-----------+
5 rows in set (0.00 sec)


inserting records:
mysql> insert into Genre (Name) values('Trad');

output:
Query OK, 1 row affected (0.01 sec)


find out ID of last insert row using:
mysql> SELECT LAST_INSERT_ID();

output:
+------------------+
| LAST_INSERT_ID() |
+------------------+
|               26 |
+------------------+
1 row in set (0.00 sec)


querying that ID returns the genre we created:
mysql> select * from Genre where GenreId = 26;

output:
+---------+------+
| GenreId | Name |
+---------+------+
|      26 | Trad |
+---------+------+
1 row in set (0.00 sec)


mysql> update Genre set Name = 'Traditional' where Name = 'Trad';

output:
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Genre;

output:
| GenreId | Name               |
+---------+--------------------+
|       1 | Rock               |
|       2 | Jazz               |
|       3 | Metal              |
|       4 | Alternative & Punk |
|       5 | Rock And Roll      |
|       6 | Blues              |
|       7 | Latin              |
|       8 | Reggae             |
|       9 | Pop                |
|      10 | Soundtrack         |
|      11 | Bossa Nova         |
|      12 | Easy Listening     |
|      13 | Heavy Metal        |
|      14 | R&B/Soul           |
|      15 | Electronica/Dance  |
|      16 | World              |
|      17 | Hip Hop/Rap        |
|      18 | Science Fiction    |
|      19 | TV Shows           |
|      20 | Sci Fi & Fantasy   |
|      21 | Drama              |
|      22 | Comedy             |
|      23 | Alternative        |
|      24 | Classical          |
|      25 | Opera              |
|      26 | Traditional        |
+---------+--------------------+
26 rows in set (0.00 sec)

Delete records:

mysql> delete from Genre where Name = 'Traditional';

output:
+---------+--------------------+
| GenreId | Name               |
+---------+--------------------+
|       1 | Rock               |
|       2 | Jazz               |
|       3 | Metal              |
|       4 | Alternative & Punk |
|       5 | Rock And Roll      |
|       6 | Blues              |
|       7 | Latin              |
|       8 | Reggae             |
|       9 | Pop                |
|      10 | Soundtrack         |
|      11 | Bossa Nova         |
|      12 | Easy Listening     |
|      13 | Heavy Metal        |
|      14 | R&B/Soul           |
|      15 | Electronica/Dance  |
|      16 | World              |
|      17 | Hip Hop/Rap        |
|      18 | Science Fiction    |
|      19 | TV Shows           |
|      20 | Sci Fi & Fantasy   |
|      21 | Drama              |
|      22 | Comedy             |
|      23 | Alternative        |
|      24 | Classical          |
|      25 | Opera              |
|      26 | Traditional        |
+---------+--------------------+
26 rows in set (0.00 sec)

mysql> delete from Genre where Name = 'Traditional';
Query OK, 1 row affected (0.01 sec)

mysql> select * from Genre where Name = 'Traditional';      #search for Traditional(this was deleted with previous command)
output:
Empty set (0.00 sec)



/* Use the Chinook database */
use Chinook;

/*
Select the name column for each of the records in
the `Artist` table
*/
select Name from Artist;

/*
Select the `FirstName` and `LastName` for each of the
records in the `Customer` table
*/
select FirstName, LastName from Customer;

/*
Select all of the columns for every record in the `Track`
table
*/
select * from Track;