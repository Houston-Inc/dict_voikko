/* contrib/dict_voikko/dict_voikko--unpackaged--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION dict_voikko" to load this file. \quit

ALTER EXTENSION dict_voikko ADD function dvoikko_init(internal);
ALTER EXTENSION dict_voikko ADD function dvoikko_lexize(internal,internal,internal,internal);
ALTER EXTENSION dict_voikko ADD text search template voikko_template;
ALTER EXTENSION dict_voikko ADD text search dictionary voikko;
