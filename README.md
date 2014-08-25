*dict_voikko*
=============

PostgreSQL full text search dictionary extension utilizing the Finnish dictionary Voikko.

*dict_voikko* uses the base form of Finnish words as lexems. For compound words it uses the base form of the non-compound words from which the compound word is built. If *dict_voikko* doesn't recognise the it returns **NULL**, so *dict_voikko* should always be chained with another dictionary.

Dependencies
------------

The dictionary needs [libvoikki](http://voikko.puimula.org/) and its dependencies. A suomi-malaga dictionary with morphological analysis for Voikko is neede (e.g. dict-morpho from [http://www.puimula.org/htp/testing/voikko-snapshot/](http://www.puimula.org/htp/testing/voikko-snapshot/)) and at the moment it needs to be called **mor-morpho**.

Installation
------------

Put **dict_voikko** in **[POSTGRES]/contrib/** and compile.

###In PostgreSQL

Run something like:

```sql
CREATE EXTENSION dict_voikko;

CREATE TEXT SEARCH DICTIONARY voikko_stopwords (
    TEMPLATE = voikko_template, StopWords = finnish
);

CREATE TEXT SEARCH CONFIGURATION voikko (COPY = public.finnish);

ALTER TEXT SEARCH CONFIGURATION voikko 
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart, word, hword, hword_part 
    WITH voikko_stopwords, finnish_stem;
```

Test with 

```sql
select ts_lexize('voikko', 'kerrostalollekohan');
```

The result should be:

```
 ts_lexize   
-----------
 {kerros,talo}
(1 row)
```