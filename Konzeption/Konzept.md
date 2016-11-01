# Konzept:

## ISO 25010 Q.-Modell

Komplettes ISO25010 Modell mit Qualitätskategorien und Kriterien.
-> Jedes Kriterium wurde in Bezug zur Aufgabenstellungen bewertet.

* Software Produkt Qualität
Siehe: Bilder/ISO25010_Modell.pdf

* Quality in use
Siehe: Bilder/QualityInUse.pdf

### Bewertung

* Funktionalität
    * Richtigkeit
        * Kriterium ausschließen
            * Nur Richtige Lösungen werden akzeptiert
            * Keine Workarounds
    * Ordnungsmäßigkeit
        * Einhaltung von anwendungsspezifischen Normen
        * Kriterium ausschließen
            * Gibt es bei Microservices - Service Normen?
  * Angemessenheit
      * Wird eine Funktion angemessen zur Verfügung gestellt?
          * Ordinalskala (z.B. schlecht, mittel, gut, sehr gut)

* Reliabilität
    * Verfügbarkeit
        * Verfügbarkeit des Services liegt an Infrastruktur / Platform
        * Circuit Breaker Pattern (Hystrix)
            * Ordinalskala (z.B. unterstützt, umsetzbar, nicht unterstützt)
  * Fehler Toleranz
      * Kriterium ausschließen
          * Fehlerbehaftete Antworten werden nicht akzeptiert
  * Wiederherstellbarkeit
      * Kriterium ausschließen
          * Service stateless
          * DB nicht im Scope

* Performance
    * Zeitverhalten
        * Startzeit
        * Reaktionszeit
        * Ausführungszeit
        * Datendurchsatz
    * Ressourcen Verbrauch
        * Heap Size
    * Kapazität
        * Kriterium ausschließen
            * Skalierung ermöglicht theoretisch unendliche Kapazität
            * Limitierung liegt in Infrastruktur und DB nicht im Service

* Benutzbarkeit
    * Der Nutzer ist der Entwickler, somit bietet sich eher Quality in use an
    * Quality in use
        * Effizienz
            * LOC + (Methodenaufrufe, Zeichen)
        * Effektivität
            * Unterstützung des User durch das Framework zum Erreichen des Ziels in %
        * Zufriedenstellung
            * Subjektiv vom Nutzer -> Ordinalskala (z.B. schlecht, mittel, gut, sehr gut)
            * Begründung notwendig da subjektiv
        * Risikofreiheit
            * Kriterium ausschließen
                * Kann ein Service ein Risiko mildern oder verstärken?
        * Kontext Abbildung
            * Kriterium ausschließen
                * Architektur schreibt kleinen Kontext für Service vor

* Sicherheit
    * Vertraulichkeit, Integrität, Authentizität
        * Schnittstelle kann durch z.B. OAuth2 gesichert werden?
        * Ordinalskala (z.B. unterstützt, umsetzbar, nicht unterstützt)
    * Nichtabstreitbarkeit, Accountability
        * Kriterium ausschließen
            * Auditing kann als zus. Datenmodell aufgefasst werden

* Kompatibilität
    * Ersetzbarkeit
        * Kriterium ausschließen
            * Grundsatz in Architektur
            * RESTful Schnittstelle von allen gleich
    * Interoperabilität
        * Einhaltung von Standards
            * REST Schnittstelle
            * JSON/XML Serialisierung
            * Ordinalskala (z.B. schlecht, mittel, gut, sehr gut)
        * Service Discovery (Eureka, Consul)
            * Mit Spring Cloud SideCar nicht notwendig
    * Co-Existence
        * Kriterium ausschließen
            * Grundsatz in Architektur

* Wartbarkeit
    * Modularität
        * Kriterium ausschließen
            * Services sollten klein sein
            * Grundsatz Architektur
    * Wiederverwendbarkeit
        * Code Reuse für weitere Services (Lib)
        * Ordinalskala (z.B. schlecht, mittel, gut, sehr gut)
    * Analysierbarkeit
        * Logging Schnittstelle
        * Ordinalskala (z.B. unterstützt, umsetzbar, nicht unterstützt)
    * Erweiterbarkeit
        * Spezielle Features vorhanden (ja/nein)
            * Caching
            * ???
    * Testbarkeit
        * Kriterium ausschließen
            * Unit Tests überall möglich
            * Schnittstelle definiert und testbar

* Übertragbarkeit
    * Anpassungsfähigkeit
        * Kriterium ausschließen
            * RESTful Schnittstelle ist definiert
            * Nur Netzwerkverbindung notwendig
    * Installierbarkeit
        * Einschränkungen OS?
        * Bewertung: Installierbar auf System ja oder nein
    * Ersetzbarkeit
        * Kriterium ausschließen
            * RESTful Schnittstelle ist definiert

## Evaluation

Festlegung der Evaluationsmethode für die Qualitätskriterien

### Usability, Funktionalität, Sicherheit, Wartbarkeit
* Cognitive Walkthrough
    * Aufgabenbeschreibung
    * Aufgabenbewertung
* Aufgabenstellungen
    1. Installation Framework
    2. Einfachster Service
        * Eine Schnittstelle "Hello Service"
        * Security
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
### ISO 25010
ISO/IEC 25010: Software-Engineering – Qualitätskriterien und Bewertung von Softwareprodukten (SQuaRE) – Qualitätsmodell und Leitlinien. März 2011.

### Software Product Quality Control
S Wagner: Software Product Quality Control, DOI 10.1007/978-3-642-38571-1 2, Springer-Verlag Berlin Heidelberg 2013

### Software Evaluation
Hegner, Marcus: Methoden zur Evaluation von Software. http: //www.gesis.org/fileadmin/upload/forschung/publikationen/gesis_ reihen/iz_arbeitsberichte/ab_29.pdf, 2003.
