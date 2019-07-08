#!/bin/bash

catmandu convert SRU --base http://services.dnb.de/sru/bib --query "*" --recordSchema PicaPlus-xml --parser ppxml to PICA --type plain > sigelverzeichnis.pica
