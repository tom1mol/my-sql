/*  Use one insert statement to insert multiple tracks at the same time 
    Use Google to find the correct syntax for the Insert statement to do this*/

INSERT INTO Track(Name, AlbumId, GenreId, MediaTypeId, Composer, Milliseconds, Bytes, UnitPrice)
Values
    ("Another Time, Another Place", 348, 2, 1, "U2", 186000, 1234, 0.99),
    ("The Electric Co.", 348, 2, 1, "U2", 187000, 1234, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, "U2", 188000, 1234, 0.99);
    