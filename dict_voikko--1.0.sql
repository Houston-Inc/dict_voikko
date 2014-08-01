/* contrib/dict_voikko/dict_voikko--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION dict_voikko" to load this file. \quit

CREATE FUNCTION dvoikko_init(internal)
        RETURNS internal
        AS 'MODULE_PATHNAME'
        LANGUAGE C STRICT;

CREATE FUNCTION dvoikko_lexize(internal, internal, internal, internal)
        RETURNS internal
        AS 'MODULE_PATHNAME'
        LANGUAGE C STRICT;

CREATE TEXT SEARCH TEMPLATE voikko_template (
        LEXIZE = dvoikko_lexize,
	    INIT   = dvoikko_init
);

CREATE TEXT SEARCH DICTIONARY voikko (
	TEMPLATE = voikko_template
);

COMMENT ON TEXT SEARCH DICTIONARY voikko IS 'dictionary for Finnish using Voikko';
