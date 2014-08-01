CREATE EXTENSION dict_voikko;

--lexize
select ts_lexize('voikko', 'kissa');
select ts_lexize('voikko', 'kissoja');
