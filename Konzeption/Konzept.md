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

### Anforderungen
* Https
* Self Defending Services - Logged Events (AppSensor)
* Permissions aus Token bzw. UserInfo Endpoint
* OAuth Support
* Bean Validation
* HATEOAS (Richardson Maturity Model Level 3)
* JSON/XML Serialisierung
* Fehler bei Inter-Service Kommunikation werden erkannt (Circuit Breaker Pattern)
* Logging
* Metric Schnittstelle
* Distributed Tracing
* Testbarkeit - Unterstützung z.B. mit Mock OAuth
* Build Infrastruktur (Maven)
* Die Entwicklung ist effizient
* Der Service lässt sich schnell um einen Endpunkt erweitern (z.B. Modell Anpassung)
* Der Service startet schnell
* Das Framework hat wenig Overhead
* Der Service hat einen hohen Durchsatz
* Der Service verwendet möglichst wenig Speicher
* Gut Dokumentation



### Hammerschall
* Methode schreibt Anforderung vor - Abklären
    * Wenn Methode sich im Praktischen Teil als falsch herausstellt,
      dann wird Methode nicht angepasst


### Quality Utility Tree

Zuordnung der Anforderung in Qualitätsziele und genauere Definition
über Goal-Question-Metrik. Anschließend Priorisierung (High, Medium, Low)

* Funktionalität
    * G: Eingehende Domänen Objekte müssen validiert werden
        * Q1: Unterstützt das Framework eine automatische Validierung von Domänen Objekten.
            * M: Ordinalskala (enthalten, leicht umsetzbar, schwer umsetzbar)
        * Priorität:
    * G: Die Schnittstelle ist nach dem HATEOAS Modell aufgebaut.
        * Q1: Baut das Framework die Schnittstelle über Ressourcen auf
            * M: Ordinalskala (automatisch, manuell, nicht möglich)
        * Q2: Fügt das Framework HATEOAS Links in die Antowrt ein
            * M: Ordinalskala (automatisch, manuell, nicht möglich)
        * Priorität:
    * G: Daten können im XML oder JSON Format übertragen werden
        * Q1: Kann das Framework Daten im JSON Format de-/serialisieren
            * M: Ordinalskala(enthalten, nicht enthalten)
        * Q2: Kann das Framework Daten im XML Format de-/serialisieren
            * M: Ordinalskala(enthalten, nicht enthalten)
        * Priorität:
    * G: Fehler bei Inter-Service Kommunikation werden erkannt und behandelt
        * Q1: Wir vom Framework das Circuit Breaker Pattern unterstützt.
            * M: Ordinalskala (enthalten, leicht umsetzbar, schwer umsetzbar)
        * Priorität:

* Performance
    * G: Skalierung der Services ist schnell und dynamisch
        * Q1: Kann eine neue Instanz vom Service schnell erstellt werden
            * M: Startzeit in Sekunden
        * Priorität:
    * G: Der Service reagiert schnell auf Anfragen und hat einen hohen Durchsatz
        * Q1: Bleibt der Service bei Lastspitzen verfügbar
            * M: Performance Messungen
        * Q2: Ist der Overhead vom Framework minimal
            * M: Performance Messungen
        * Priorität:
    * G: Der Service verwendet möglichst wenig Speicher
        * Q1: Ist der Service leichtgewichtig.
            * M: Messung Heap Size
        * Priorität:

* Benutzbarkeit
    * G: Der Service lässt sich einfach und vollständig testen
        * Q1: Unterstützt das Framework Mocking von ext. Abhängigkeiten
            * M: Ordinalskala (enthalten, leicht umsetzbar, schwer umsetzbar)
        * Priorität:
    * G: Zum Framework gibt es eine Build Infrastruktur
        * Q1: Lässt sich automatisiert ein Build vom Service erstellen
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Priorität:
    * G: Die Entwicklung mit dem Framework ist effizient
        * Q1: Ist die Umsetzung von Grundlegenden Funktionen komplex
            * M: LoC und Methodenaufrufe bei einem Service mit einer Schnittstelle
        * Q2: Ist die Umsetzung von erweiterten Funktionen komplex
            * M: LoC und Methodenaufrufe bei einem Service mit einem Datenmodell
        * Q3: Lässt sich das Framework einfach und schnell installieren
            * M: Ordinalskala (sehr gut, gut, schlecht)
        * Priorität
    * G: Gute Dokumentation
        * Q1: Bietet das Framework eine umfangreiche Dokumentation mit Beispielen
            * M: Ordinalskala (Sehr Umfangreich mit Beispielen, Umfangreich, Einfach, keine)
        * Priorität:

* Sicherheit
    * G: Die Datenübertragung zum und vom Service ist abgesichert
        * Q1: Unterstützt das Framework HTTPS
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Priorität:
    * G: Missbrauch vom Service kann unterbunden werden
        * Q1: Lassen sich über das Framework Events loggen
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Q2: Kann das Framework Missbrauch über Events feststellen
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Priorität:
    * G: Der Zugriff auf den Service ist abgesichert
        * Q1: Unterstützt das Framework OAuth2
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Q2: Können Funktionen über Permissions eingeschränkt werden
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Priorität:

* Wartbarkeit
    * G: Der Status vom Service kann Zentral erfasst werden
        * Q1: Bietet das Framework eine Schnittstelle für Logging
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Q2: Bietet das Framework eine Schnittstelle für Metriken
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Q3: Bietet das Framework eine  Unterstüzung von Distributed Tracing
            * M: Ordinalskala (Verfügbar, leicht umsetzbar, schwer umsetzbar)
        * Priorität:
    * G: Anpassungen am Service sind einfach
        * Q1: Kann der Service effizient um eine Schnittstelle erweitert werden
            * M: LoC, Methodenaufrufe
        * Priorität:


## Evaluation

Festlegung der Evaluationsmethode für die Qualitätsziele.

### Funktionalität, Benutzbarkeit, Sicherheit, Wartbarkeit
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
