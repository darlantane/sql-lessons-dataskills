select * from film
  where rating == 'PG-13'
  ;
-- instruction like
select * from film
  where rating like 'PG%'
  ;

-- combinaison de and de or
select * from film 
  where length <= 60
  and (rating == 'PG-13' or rating == 'PG')
  ;

-- exemple de order by
select * from film
  where rating <> 'PG-13'
  order by title, film_id;

-- exemple de regroupement sur les fonctions AVG et MAX
select rating, AVG(rental_duration) , MAX(rental_duration) from film
  group by rating
  ;
--Tous les films avec un rental_rate supérieur  à 1 
-- avec des deleted scenes
select * from film
  where rental_rate > 1
  and special_features like '%deleted scenes%'
;

-- Requete avec fonction agrégée et critère sur une colonne agrégée:
-- count (*)
select rating, count (*) 
  from film 
  where rating <> 'PG-13'
  group by rating
  having count(*) > 100
  order by rating;

-- La moyenne des rental_rate regroupée par rental_duration
-- sur les films dont la durée dépasse 1h
select rental_duration, AVG(rental_rate) from film
  where length > 60
  group by rental_duration;

-- 3 types de jointures
-- une mauvaise
select *
  from film, language
  where film.language_id == language.language_id;

-- jointure ou les clés sont spécifiées
-- film.language_id clé étrangère
-- language.language_id clé primaire
select title, name
  from film inner join language
  on film.language_id == language.language_id;

-- jointure naturelle sur des colonnes avec le même nom
select title, name
  from film natural join language;

select title, name
  from film right join language
  on film.language_id == language.language_id;

