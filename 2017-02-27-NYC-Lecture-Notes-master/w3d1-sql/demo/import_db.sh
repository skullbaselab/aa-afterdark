#!/usr/bin/env sh

dropdb twitter
createdb twitter
psql twitter < create-db.sql
