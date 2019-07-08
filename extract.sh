#!/bin/bash

# Haupt-Befehl
catmandu convert plain --file sigelverzeichnis.pica --fix library-apis_fix.txt to JSON > library-apis.json

# API-Typen-Check
#catmandu convert plain --file sigelverzeichnis.pica --fix api-types_fix.txt to JSON
