## [Sigelverzeichnis URLs](https://sigel.staatsbibliothek-berlin.de/startseite/)

Diese Skripte laden alle Seiten des Sigelverzeichnisses herunter und prüfen diese auf folgende URLs:

Hildesheim Beispiel:
SRU: http://sru.gbv.de/opac-de-hil2
PAIA: https://paia.gbv.de/DE-Hil2/
DAIA: https://paia.gbv.de/DE-Hil2/daia

Diese URLs werden dann in eine Liste geschrieben, sodass man das Vorhandensein überprüfen kann.

[**Format**](https://sigel.staatsbibliothek-berlin.de/vergabe/adressenformat/)

[**Beispiel**](https://services.dnb.de/sru/bib?operation=searchRetrieve&query=isl%3DDE-Hil2&recordSchema=PicaPlus-xml&version=1.1)

---

### Alle Sigel-Seiten des Sigelverzeichnisses herunterladen

(Dies kann eine Weile dauern.)
 
    catmandu convert SRU --base http://services.dnb.de/sru/bib --query "*" --recordSchema PicaPlus-xml --parser ppxml to PICA --type plain > sigelverzeichnis.pica

oder

    ./download.sh

---

### Inhalt in extra Datei einspielen

    catmandu convert plain --file sigelverzeichnis.pica --fix library-apis_fix.txt to JSON > library-apis.json

oder

    ./extract.sh
    
Zuletzt, um sich die Liste anzeigen zu lassen:

    jq '.[]|select(.daia,.paia,.sru)' library-apis.json
    
---
    
### Mit Dateien arbeiten

Histogramm erstellen: 

    jq -r '.[].APIs[]'  finalList.txt | sort | uniq -c | sort -n
    
JSON-Ansicht:

    cat library-apis.json | jq

API-Typen ermitteln mit `api-Types_fix.txt`:

`extract.sh` mit Editor öffnen, den ersten Befehl auskommentieren, den zweiten entkommentieren dannach aufrufen mit:

    ./extract.sh
