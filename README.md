# rf-ugpapi-async
An independent rewrite of the RelativeFinder.org UGP service using Python 3, AsyncIO, etc.

## Background
RelativeFinder.org is a website written by students in the Family History Technology Lab (FHTL) at BYU (part of the CS department) that uses data from FamilySearch.org and allows individuals to quickly determine if they are related to other people (deceased and living) of interest.  The current backend code for Relative Finder is split into several services.  The largest of these services is the Users, Groups, and People (UGP) service, and is written in synchronous Python 2 with the Flask framework.

## What is this project then?
This is an independent effort to write an API compatible version of the UGP service using async Python 3.  It is purely experimental.  If this is successful, then at some point it may replace the existing UGP service as a way to reduce costs.

## Disclaimer
I am a *former* employee of the FHTL.  This project is not sponsored by BYU.
