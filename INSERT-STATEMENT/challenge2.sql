Run the following Query. It gives an error. Read and understand the error, then fix the problem

            Insert into Track (Name, AlbumId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
            values("Extra Track", 348, 1, "U2", 290000, 1234, 0.99);
            
            (is missing MediaTypeId....and its value)
            
Insert into Track (Name, AlbumId, GenreId, MediaTypeId, Composer, Milliseconds, Bytes, UnitPrice)
values("Extra Track", 348, 2, 1, "U2", 290000, 1234, 0.99);
            