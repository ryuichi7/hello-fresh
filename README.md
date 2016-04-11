# README

## Description

This app parses data form the USDA food database and ingredient data provided by Hello Fresh.
It translates and normalizes the data, then associates the data with models.

## Usage

Fork this repo

run in the command line:
```shell
$ rake db:migrate
```
then
```shell
$ rake importer:import
```
