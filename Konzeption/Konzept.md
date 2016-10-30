# Konzept:

## ISO 25010 Q.-Modell

* Funktionalität
  * Richtigkeit
    * Kriterium ausschließen?
      * Nur Richtige Lösungen werden akzeptiert
      * Keine Workarounds
  * Ordnungsmäßigkeit
    * Einhaltung von anwendungsspezifischen Normen
    * Kriterium Ausschließen?
      * Gibt es bei Microservices - Service Normen?
  * Angemessenheit
    * Abwägung ob das Framework eine Funktion angemessen zur Verfügung stellt
      * Bewertung finden (z.B. schlecht, mittel, gut, sehr gut)

* Reliabilität
  * Verfügbarkeit
    * Kriterium ausschließen?
      * Frameworks verfügbar
      * Service Verfügbarkeit hängt an Infrastruktur / Auslastung
  * Fehler Toleranz
    * Kriterium ausschließen?
      * Fehlerbehaftete Antworten werden nicht akzeptiert
  * Wiederherstellbarkeit
    * Kriterium ausschließen?
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
    * Kriterium ausschließen?
      * Skalierung ermöglicht theoretisch unendliche Kapazität
      * Limitierung liegt in Infrastruktur und DB nicht im Service

* Benutzbarkeit
  * Quality in use
    * Effizienz
      * LOC, Methodenaufrufe, Zeichen
    * Effektivität
      * Unterstützung des User durch das Framework zum Erreichen des Ziels in %
    * Zufriedenstellung
      * Subjektiv vom Nutzer -> Bewertung finden (z.B. schlecht, mittel, gut, sehr gut)
      * Begründung notwendig da subjektiv

* Sicherheit
  * Vertraulichkeit, Integrität, Authentizität
    * Schnittstelle kann durch z.B. OAuth2 gesichert werden?
    * Bewertung finden (z.B. unterstützt, umsetzbar, nicht unterstützt)
  * Nichtabstreitbarkeit, Accountability
    * Kriterium ausschließen?
      * Auditing kann als zus. Datenmodell aufgefasst werden

* Kompatibilität
  * Ersetzbarkeit
    * Kriterium ausschließen?
      * Grundsatz in Architektur
      * RESTful Schnittstelle von allen gleich
  * Interoperabilität
    * Einhaltung von Standards
      * REST Schnittstelle
      * JSON/XML Serialisierung
    * Bewertung finden (z.B. schlecht, mittel, gut, sehr gut)
  * Co-Existence
    * Kriterium ausschließen?
      * Grundsatz in Architektur

* Wartbarkeit
  * Modularität
    * Kriterium ausschließen?
      * Services sollten klein sein
      * Grundsatz Architektur
  * Wiederverwendbarkeit
    * Code Reuse für weitere Services (Lib)
    * Bewertung finden (z.B. schlecht, mittel, gut, sehr gut)
  * Analysierbarkeit
    * Logging Schnittstelle
    * Bewertung finden (z.B. unterstützt, umsetzbar, nicht unterstützt)
  * Erweiterbarkeit
    * Wünschenswerte Features
      * Caching
      * Sonstiges
  * Testbarkeit
    * Kriterium ausschließen?
      * Unit Tests überall möglich
      * Schnittstelle definiert und testbar

* Übertragbarkeit
  * Anpassungsfähigkeit
    * Kriterium ausschließen?
      * RESTful Schnittstelle ist definiert
      * Nur Netzwerkverbindung notwendig
  * Installierbarkeit
    * Einschränkungen OS?
    * Bewertung: Installierbar auf System ja oder nein
  * Ersetzbarkeit
    * Kriterium ausschließen?
      * RESTful Schnittstelle ist definiert

## Evaluation

* Usability, Funktionalität, Sicherheit, Wartbarkeit
  * Cognitive Walkthrough
    * Aufgabenbeschreibung
    * Aufgabenbewertung
  * Aufgabenstellungen
    * 1. Installation Framework
    * 2. Einfachster Service
      * Eine Schnittstelle "Hello Service"
    * 3. Komplexerer Service
      * Modell mit Relation und dazugehörigen Schnittstellen

* Performance
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

### Software Evaluation
Hegner, Marcus: Methoden zur Evaluation von Software. http: //www.gesis.org/fileadmin/upload/forschung/publikationen/gesis_ reihen/iz_arbeitsberichte/ab_29.pdf, 2003.