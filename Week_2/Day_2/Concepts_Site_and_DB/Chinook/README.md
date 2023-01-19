## Requêtes SQL permettant d'obtenir les infos demandées sur notre BDD musicale:

- Récupérer tous les albums:

    ```shell
    SELECT * FROM albums;
    ``` 

  Ou, pour avoir seulement les titres:

    ```shell
    SELECT Title FROM albums;
    ``` 

- Récupérer tous les albums dont le titre contient "Great" (indice):

    ```shell
    SELECT * FROM albums
    WHERE Title LIKE '%Great%';
    ``` 

  Ou, pour avoir seulement les titres:

    ```shell
    SELECT Title FROM albums
    WHERE Title LIKE '%Great%';
    ``` 

- Donner le nombre total d'albums contenus dans la base (sans regarder les id bien sûr):

    ```shell
    SELECT COUNT (Title) FROM albums;
    ``` 

- Supprimer tous les albums dont le nom contient "music":

    ```shell
    DELETE FROM albums WHERE title LIKE '%music%';
    ``` 

- Récupérer tous les albums écrits par AC/DC:

    ```shell
    SELECT Name FROM tracks
    INNER JOIN artists ON artists.ArtistId = albums.ArtistId
    WHERE artists.Name = 'AC/DC';
    ``` 

- Récupérer tous les titres des albums de AC/DC:

    ```shell
    SELECT tracks.name FROM tracks
    INNER JOIN albums ON albums.AlbumID = tracks.AlbumId
    INNER JOIN artists ON artists.ArtistId = albums.AlbumId
    WHERE artists.Name = 'AC/DC';
    ``` 

- Récupérer la liste des titres de l'album "Let There Be Rock":

    ```shell
    SELECT tracks.name FROM tracks
    INNER JOIN albums ON tracks.AlbumId = albums.albumId
    WHERE albums.Title = "Let There Be Rock";
    ``` 

- Afficher le prix de cet album ainsi que sa durée totale:

    ```shell
    SELECT SUM(Milliseconds), SUM(UnitPrice) FROM tracks
    INNER JOIN albums ON tracks.AlbumId = albums.albumId
    WHERE albums.Title = "Let There Be Rock";
    ``` 

- Afficher le coût de l'intégralité de la discographie de "Deep Purple":

    ```shell
    SELECT SUM(UnitPrice) FROM tracks
    INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
    INNER JOIN artists ON artists.ArtistId = albums.ArtistId
    WHERE artists.Name = "Deep Purple";
    ``` 

- Créer l'album de ton artiste favori en base, en renseignant correctement les trois tables albums, artists et tracks:

    ```shell
    INSERT INTO artists (name) VALUES ('The Beatles');
    INSERT INTO albums (Title, ArtistId) VALUES ('Abbey Road', (SELECT ArtistId FROM artists WHERE artists.name = 'The Beatles'));
    INSERT INTO tracks (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ('Come Together', (SELECT AlbumId FROM albums WHERE albums.Title = 'Abbey Road'), (SELECT MediaTypeId FROM media_types WHERE media_types.Name = 'MPEG audio file'), (SELECT GenreId FROM genres WHERE genres.Name = 'Rock'), 'John Lennon', 258000, 4371533, 0.99 );
    ``` 