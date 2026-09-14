# Flostoslista

Flostoslista on Flutterilla toteutettava ostoslistasovellus, jonka tavoitteena on mahdollistaa sekä henkilökohtaisen että jaetun ostoslistan käyttö.

Projekti on samalla oma oppimisprojektini, jonka kautta harjoittelen Flutter- ja Dart-ohjelmointia, sovelluksen rakenteen suunnittelua sekä myöhemmin client–server-arkkitehtuuria.

## Projektin nykyinen tila

Tällä hetkellä sovelluksessa on toimiva paikallinen ostoslista.

Käyttäjä voi:

- lisätä tuotteita ostoslistalle
- merkitä tuotteita ostetuiksi
- poistaa yksittäisiä tuotteita
- poistaa kaikki ostetut tuotteet vahvistusikkunan kautta
- sulkea ja käynnistää sovelluksen uudelleen ilman, että lista katoaa

Paikallinen ostoslista tallennetaan laitteen tallennustilaan `SharedPreferences`-kirjaston avulla.

## Teknologiat

- **Dart**
- **Flutter**
- **SharedPreferences**
- **Git / GitHub**

## Arkkitehtuuri

Sovelluksessa on pyritty erottamaan käyttöliittymä, sovelluksen toiminnallisuus ja datan tallennus toisistaan.

Nykyinen rakenne on pääpiirteissään:

```text
UI
│
├── HomeScreen
└── ListScreen
      │
      ▼
ShoppingListService
      │
      ▼
ShoppingListRepository
      │
      ▼
LocalShoppingListRepository
      │
      ▼
SharedPreferences
```

Repository-rajapinnan tarkoituksena on erottaa datan käsittely käyttöliittymästä. Tämä mahdollistaa myöhemmin toisen repository-toteutuksen lisäämisen ilman, että koko käyttöliittymää tarvitsee rakentaa uudelleen.

## Malli

Ostoslistan yksittäinen tuote on `ShoppingItem`, joka sisältää:

- yksilöllisen tunnisteen
- tuotteen nimen
- tiedon siitä, onko tuote ostettu

Tuotteet voidaan muuntaa JSON-muotoon tallentamista varten ja palauttaa JSON-datasta takaisin `ShoppingItem`-olioiksi.

## Seuraavat tavoitteet

Projektin seuraava vaihe on toteuttaa Raspberry Pi:llä toimiva REST API ja uusi repository, jonka kautta Flutter-sovellus voi käyttää jaettua ostoslistaa.

Tavoitteena on lopulta tarjota sovelluksessa kaksi vaihtoehtoa:

```text
Päävalikko

├── Oma lista
│     └── Tallennetaan paikallisesti laitteelle
│
└── Jaettu lista
      └── Tallennetaan Raspberry Pi:lle
```

Ensimmäisessä vaiheessa Raspberry Pi:n kautta toimiva lista on tarkoitus rajata kotiverkkoon. Etäkäyttöä ja siihen liittyviä tietoturvaratkaisuja suunnitellaan myöhemmin.

## Projektin tavoitteet

Projektin tärkein tavoite on toimivan sovelluksen rakentamisen lisäksi oppia käytännössä:

- Flutter- ja Dart-ohjelmointia
- olio-ohjelmointia
- käyttöliittymän ja sovelluslogiikan erottamista
- repository- ja service-rakenteita
- JSON-datan käsittelyä
- paikallista datan tallentamista
- REST API:n toteuttamista
- client–server-kommunikaatiota
- Raspberry Pi:n hyödyntämistä palvelimena
- sovelluksen kehittämistä Gitin ja GitHubin avulla

Projekti on aktiivisessa kehityksessä.
