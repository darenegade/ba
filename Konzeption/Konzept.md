# Konzept:

## Vorgehensmodell

Das Vorgehensmodell ist eine Abwandlung der Software Architektur Evaluation Methode
(SAEM) und Architectur Tradeoff Analysis Method (ATAM)
Diese Methode beschreibt folgende Schritte.

1. Analyse: Bestimmung von Qualitätszielen für das Produkt
    * Hier kann die Goal - Question - Metrik Methode genutzt werden
    * Es wird ein Quality Utility Tree aufgebaut
    * Goals werden anschließend mit Prioritäten versehen
2. Bewertung: Die Architektur wird auf die Qualitätsziele untersucht und bewertet
    * Normalerweise wird hier mittels Workshops und Experten Wissen eine Einschätzung getroffen
    * Hier soll das Experten Wissen durch Prototyping gewonnen werden
    * Durch das Prototyping lassen sich auch Quantitative Daten erfassen (Performance)
3. Tradeoff: Gesamtbewertung der Architektur
    * Anhand der Bewertungen wird eine Gesamtbewertung gefunden, die
      eine Aussage über die zu erwartende Qualität trifft


## Analyse

Es werden Views als Stakeholder definiert, um mehrere Aspekte einzuschließen.
Stakeholder: Entwickler (E), Administrator (A)

## Anforderungen Claus
* Https
* Permissions aus Token
* Bean Validation
* AppSensor - Events vom Service???
* Testbarkeit - Unterstützung z.B. mit Mock OAuth
* Build Infrastruktur wie Maven??
* HATEOAS (Rest Modell)


## Hammerschall
* Methode schreibt Anforderung vor - Abklären
    * Wenn Methode sich im Praktischen Teil als falsch heraustellt,
      dann wird Methode nicht angepasst


### Quality Utility Tree

* Funktionalität
    * Richtigkeit
        * Noch kein Goal
    * Vollständigkeit
        * Noch kein Goal
    * Angemessenheit
        * Noch kein Goal

* Reliabilität
    * Verfügbarkeit
        * G: Der Zugriff auf andere Services wird abgesichert (A) (Circuit Breaker Pattern)
            * Q: Das Framework unterstützt das Circute Braker Pattern
            * M: Ordinalskala (z.B. unterstützt, umsetzbar, nicht unterstützt)
    * Fehler Toleranz
        * Noch kein Goal
    * Wiederherstellbarkeit
        * Noch kein Goal

* Performance
    * Zeitverhalten
        * Startzeit
        * Reaktionszeit
        * Ausführungszeit
        * Datendurchsatz
    * Ressourcen Verbrauch
        * Heap Size
    * Kapazität
        * Noch kein Goal

* Benutzbarkeit
    * Der Nutzer ist der Entwickler, somit bietet sich eher Quality in use an
    * Quality in use
        * Effizienz
            * G: Die Entwicklung ist Effizient (E)
                * Q: Ein Service kann mit wenig Aufwand entwickelt werden
                * M: LOC + (Methodenaufrufe, Zeichen)
        * Effektivität
            * G: Das Framework unterstützt den Nutzer beim erreichen seines Ziels
                * Q: Möglichst viele Funktionen werden vom Framework bereitgestellt
                * M: Funktionen die vom Framework übernommen werden in %
        * Zufriedenstellung
            * Noch kein Goal
        * Risikofreiheit (persönlich, wirtschaftlich, Umgebung)
            * Noch kein Goal
        * Kontext Abbildung
            * Noch kein Goal

* Sicherheit
        * G: Schnittstelle sind durch Authentifizierung abgesichert
            * Q: Das Framework unterstützt die Absicherung von Endpunkten
            * Ordinalskala (z.B. unterstützt, umsetzbar, nicht unterstützt)

* Kompatibilität
    * Ersetzbarkeit
        * Noch kein Goal
    * Interoperabilität
        * G: Der Service kann mittels JSON oder XML kommunizieren
            * Q: Werden ein- oder ausgehende Daten mittels JSON/XML Serialisiert?
            * M: Ordinalskala (z.B. schlecht, mittel, gut)
    * Co-Existence
        * Noch kein Goal

* Wartbarkeit
    * Modularität
        * G: Einzelne Komponenten sind sauber getrennt
            * Q: Wie stark sind Komponenten miteinander verbunden.
            * M: ???
    * Wiederverwendbarkeit
        * Noch kein Goal
    * Analysierbarkeit
        * G: Logging Schnittstelle
            * Q: Das Framework bietet eine Logging Schnittstelle
            * M: Ordinalskala (z.B. unterstützt, umsetzbar, nicht unterstützt)
    * Erweiterbarkeit
        * G: Der Service kann einfach um weitere Endpunkte erweitert werden
            * Q: Kann die Schnittstelle zerstörungsfrei um weitere Endpunkte erweitert werden
            * M: Ordinalskala (z.B. schlecht, mittel, gut)
    * Testbarkeit
        * Noch kein Goal


* Übertragbarkeit
    * Anpassungsfähigkeit
        * G: Es werden mehrere Datenbank Typen unterstützt
            * Q: ??
            * M: ??
    * Installierbarkeit
        * G: Das Framework kann einfach installiert werden
            * Q: Wie viel Aufwand erfordert die Installation
            * M: Ordinalskala?
    * Ersetzbarkeit
        * Noch kein Goal

## Evaluation

Festlegung der Evaluationsmethode für die Qualitätskriterien

### Funktionalität, Benutzbarkeit, Wartbarkeit
* Cognitive Walkthrough
    * Aufgabenbeschreibung
    * Aufgabenbewertung
* Aufgabenstellungen
    1. Installation Framework
    2. Einfachster Service
        * Eine Schnittstelle "Hello Service"
        * Security enthalten
    3. Komplexerer Service
        * Modell mit Relation und dazugehörigen Schnittstellen

### Performance
* Tool: JMeter
* Benchmark-Test
    * Anforderungsprofile
        * Profil 1: Datenservice
            * parallele Anfragen: 50.000
            * CRUD auf DB
        * Profil 2: BA-Service einfach, wenige Anfragen
            * parallele Anfragen: 500
            * wenig rechenintensive Aufgabe
        * Profil 3: BA-Service einfach , viele Anfrage
            * parallele Anfragen: 50.000
            * wenig rechenintensive Aufgabe
        * Profil 4: BA-Service komplex, wenig Anfragen
            * parallele Anfragen: 500
            * stark rechenintensive Aufgabe
        * Profil 5: BA-Service komplex, viele Anfragen
            * parallele Anfragen: 50.000
            * stark rechenintensive Aufgabe


## Literatur

### Software Evaluation
Hegner, Marcus: Methoden zur Evaluation von Software. http: //www.gesis.org/fileadmin/upload/forschung/publikationen/gesis_ reihen/iz_arbeitsberichte/ab_29.pdf, 2003.
