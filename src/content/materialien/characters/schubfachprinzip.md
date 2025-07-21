---
title: Das Schubfachprinzip
description: "Eine der wichtigsten Beweistechniken der Kombinatorik - einfach erklärt mit vielen Beispielen"
# image: "@assets/materialien/kombinatorik/schubfachprinzip.jpg"
imageAlt: "Darstellung von Schubfächern mit zu vielen Objekten"
pubDate: 2024-07-15
modDate: 2024-08-03
---

Das **Schubfachprinzip** (auch Taubenschlagprinzip genannt) ist eine der elegantesten und mächtigsten Beweistechniken in der Mathematik. Trotz seiner Einfachheit löst es verblüffend komplexe Probleme!

---

## Die Grundidee

> **Schubfachprinzip**: Wenn man n+1 Objekte in n Schubfächer verteilt, dann enthält mindestens ein Schubfach mindestens 2 Objekte.

### Anschauliches Beispiel
In deiner Klasse mit 32 Schüler*innen haben mindestens 3 Personen im gleichen Monat Geburtstag. Warum?

**Lösung**: Es gibt nur 12 Monate (= 12 Schubfächer), aber 32 Schüler*innen (= 32 Objekte). Nach dem Schubfachprinzip müssen also mindestens ⌈32/12⌉ = 3 Personen im gleichen Monat geboren sein.

---

## Klassische Wettbewerbs-Aufgaben

### Aufgabe 1: Punkte im Quadrat
In einem Quadrat mit Seitenlänge 1 werden 5 Punkte beliebig platziert. Zeige: Es gibt immer zwei Punkte mit Abstand höchstens √2/2.

**Lösungsidee**: Teile das Quadrat in 4 kleinere Quadrate...

### Aufgabe 2: Socken-Problem  
Du hast 100 rote und 100 blaue Socken durcheinander in einem Koffer. Wie viele Socken musst du **mindestens** ziehen, um sicher ein passendes Paar zu haben?

**Antwort**: 3 Socken! (2 Farben = 2 Schubfächer, 3 Socken = 3 Objekte)

### Aufgabe 3: Zahlen und Reste
Unter 10 beliebigen ganzen Zahlen gibt es immer zwei, deren Differenz durch 9 teilbar ist.

**Beweis**: Die Reste beim Teilen durch 9 können nur 0,1,2,...,8 sein (9 Schubfächer). Bei 10 Zahlen müssen zwei den gleichen Rest haben, ihre Differenz ist also durch 9 teilbar.

---

## Verallgemeinerungen

### Verallgemeinertes Schubfachprinzip
Wenn man n Objekte in k Schubfächer verteilt, dann enthält mindestens ein Schubfach mindestens ⌈n/k⌉ Objekte.

### Beispiel: Handschlag-Problem
Bei einer Party mit 367 Menschen haben mindestens zwei Personen am gleichen Tag Geburtstag.
- 367 Menschen, 366 mögliche Geburtstage → mindestens ⌈367/366⌉ = 2 am gleichen Tag

---

## Übungsaufgaben

1. **Leicht**: Beweise, dass unter 13 Personen mindestens zwei im gleichen Monat Geburtstag haben.

2. **Mittel**: In einer Schulklasse mit 30 Schüler*innen werden Noten von 1 bis 6 verteilt. Zeige: Mindestens 5 Schüler*innen haben die gleiche Note.

3. **Schwer**: Auf einem Schachbrett (8×8) werden 9 Türme so platziert, dass sie sich nicht gegenseitig bedrohen. Zeige: Es gibt eine Zeile oder Spalte ohne Turm.

---

## Tipps für Wettbewerbe

1. **Schubfächer identifizieren**: Was sind die "Kategorien"?
2. **Objekte zählen**: Wie viele Elemente werden verteilt?  
3. **Rechnen**: Mindestens ⌈Objekte/Schubfächer⌉ pro Kategorie
4. **Interpretation**: Was bedeutet das für die Aufgabe?

---

Das Schubfachprinzip ist dein Freund bei scheinbar unlösbaren Problemen. Mit etwas Übung erkennst du schnell, wann es anwendbar ist!

**Nächster Schritt**: Probiere unsere [Kombinatorik-Übungsaufgaben](/materialien/kombinatorik/uebungen) aus!
