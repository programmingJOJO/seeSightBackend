
#country = Country.find_or_create_by!(name: 'Deutschland', iso_code: 'de')
city = City.find_or_create_by(name: 'Nürnberg')
#city.update_attributes!(lat: 49.45052, lng: 11.08048)
#country.cities << city
#country.save!
=begin
# PLACE Kaiserburg
desc = 'Über die Toranlage gelangt man in den äußeren Burghof - dort wird man mit einem einzigartigen Blick über die Altstadt belohnt! ' +
'Du solltest auch einen Blick in den inneren Burgbereich werfen, der damals übrigens ausschließlich dem Kaiser während der Reichstage vorbehalten war. ' +
'Heute kannst du hier das Kaiserburg-Museum oder den Palas besuchen, den tiefen Burggraben besichtigen oder den sogenannten Sinnweltturm besteigen.'
p1 = Place.create!(name: 'Kaiserburg', description: desc, place_type: 0, city: city, lat: 49.457850, lng: 11.075858)
c = 'In der Burgmauer nahe des Fünfeck-Turmes befinden sich zwei Hufabdrücke. Der Sage nach gab es einst einen Raubritter ' +
    'namens Eppelein. Kurz vor seiner Hinrichtung wurde ihm ein letzter Wunsch erfüllt. Eppelein wollte noch einmal auf seinem Pferd sitzen. ' +
    'Beim Sitzen blieb es jedoch nicht: Eppelein soll durch einen tollkühnen Sprung mit dem Pferd entwischt sein - und somit die Hufabdrücke in der Burgmauer hinterlassen haben. ' +
    'Über was sprang Eppelein mt seinem Pferd?'
p1.challenges.create!(question: c, difficulty: 2)
challenge = p1.challenges.first
challenge.challenge_solutions.create!(answer: 'Die Stadtmauer', truth: false)
challenge.challenge_solutions.create!(answer: 'Den Schafott', truth: false)
challenge.challenge_solutions.create!(answer: 'Den Burggraben', truth: true)
challenge.hints.create!(description: 'Wenn du die Hufeisen findest, ist die Antwort ganz leicht.')


# PLACE Tiergärtnerplatz
desc = 'Nachdem du dich vom Aufstieg erholt und den Ausblick genossen hast, geht es weiter in Richtung Tiergärtnerplatz. ' +
'Die Fachwerkhäuser blieben während des 2. Weltkriegs weitgehend verschont. ' +
'Der Platz ist in lauen Sommernächten ein beliebter Treffpunkt für junge Leute.'
p2 = Place.create(name: 'Tiergärtnertorplatz', description: desc, place_type: 0, city: city, lat: 49.457447, lng: 11.074014)
c = 'Vor dem Pilatushaus befindet sich eine Bronzeplastik. Hast du sie entdeckt? Erstellt wurde die Plastik von dem Künstler Jürgen Goertz im Jahr 1984. Welchem Künstler wurde sie gewidmet?'
p2.challenges.create!(question: c, difficulty: 1)
challenge = p2.challenges.first
challenge.challenge_solutions.create!(answer: 'Dürer', truth: true)
challenge.hints.create!(description: 'Das Haus des Künstlers ist auch gleich in der Nähe. Hilft dir das weiter?')
challenge.hints.create!(description: 'Der Nachname reicht bereits für eine korrekte Antwort. Achja, darin befindet sich ein Umlaut.')

# PLACE St Sebald
desc = 'St. Sebald ist die älteste Kirche Nürnbergs. Ihren Namen hat sie vom Heiligen Sebaldus der in Nürnberg geboren wurde und auch starb. ' +
'Sein Grab befindet sich innerhalb der Pfarrkirche, ein filigranes Werk des 16. Jahrhunderts.'
p8 = Place.create(name: 'St Sebald', description: desc, place_type: 0, city: city, lat: 49.455260, lng: 11.076602)
c = 'Am Sebalder Platz gleich neben der Kirche befand sich früher ein Friedhof. Das Gebäude, welches sich darin befand, kann man noch erahnen, wenn man den Platz näher erkundet. Kommst du auf den Namen?'
p8.challenges.create(question: c, difficulty: 2)
challenge = p8.challenges.first
challenge.challenge_solutions.create!(answer: 'Moritzkapelle', truth: true)
challenge.hints.create!(description: 'Den Umriss kann man sehr gut an den großen Pflastersteinen erkennen. Vielleicht findest du dort einen Hinweis auf den Namen.')

# PLACE Weißgerbergasse
desc = 'Etwa 20 historische Häuser haben hier den Krieg überlebt und geben eine Vorstellung vom ursprünglichen Aussehen vieler Altstadtstraßen. ' +
'Wie der Name schon sagt, lebten in dieser Gasse vorwiegend Weißgerber, die mit Hilfe von Alaun (Kaliumaluminiumsulfat) feines Leder herstellten. ' +
    'Heute ist die Weißgerbergasse ein beliebtes Kneipenviertel.'
p3 = Place.create(name: 'Weißgerbergasse', description: desc, place_type: 0, city: city, lat: 49.455180, lng: 11.072795)
c = 'An einer der Häuserfronten kann man die typischen Werkzeuge der Weißgerber entdecken. Finde sie und erzähle uns, was neben dem Stampfer als weiteres Werkzeug noch abgebildet ist!'
p3.challenges.create!(question: c, difficulty: 3)
challenge = p3.challenges.first
challenge.challenge_solutions.create!(answer: 'Messer', truth: true)
challenge.hints.create!(description: 'Die Werkzeuge sind an dem Haus mit der Hausnummer 24 zu finden.')

# PLACE Kettensteg
desc = 'Der Kettensteg wurde 1824 als erste frei schwebende Hängebrücke Deutschlands errichtet und misst etliche Meter. Damals entsprach sie einer echten Pionierleistung. ' +
    'Ursprünglich stand dort einmal ein hölzerner Trockensteg, der bereits auf einer Federzeichnung von Albrecht Dürer abgebildet ist.'
p4 = Place.create(name: 'Kettensteg', description: desc, place_type: 0, city: city, lat: 49.454272, lng: 11.070902)
c = 'Die Hängebrücke ist schon sehr lang. Aber wie lang denn nun genau?'
p4.challenges.create!(question: c)
challenge = p4.challenges.first
challenge.challenge_solutions.create!(answer: '40 Meter.', truth: false)
challenge.challenge_solutions.create!(answer: '60 Meter.', truth: false)
challenge.challenge_solutions.create!(answer: '80 Meter!', truth: true)
challenge.challenge_solutions.create!(answer: '100 Meter!', truth: false)
challenge.hints.create!(description: 'Es hilft nichts. Das musst du entweder persönlich nachprüfen, indem du deine Schritte nachzählst oder schätzen.')

# PLACE Unschlittplatz
desc = 'Der Name des Platzes und des darauf stehenden Unschlitthauses geht zurück bis ins Jahr 1562, als dort das Unschlittamt untergebracht wurde. ' +
    'Es fungierte als städtische Monopolbehörde für nicht genießbares Abfallfett (Unschlitt). ' +
    'Alle Metzger der Stadt mussten ihren Unschlitt hier abgeben, während es die Stadt zu festen Preisen an andere Gewerbe weiterverkaufte. ' +
'Bis ins 19. Jh. war Unschlitt ein bedeutender Rohstoff für Kerzen.'
p5 = Place.create(name: 'Unschlittplatz', description: desc, place_type: 0, city: city, lat: 49.452697, lng: 11.072204)
c = 'Historische Bedeutung und Bekanntheit erlangte der Platz durch eine rätselhafte Person. Für sie wurde eigens eine Gedenktafel angebracht. Wer ist gemeint?'
p5.challenges.create!(question: c)
challenge = p5.challenges.first
challenge.challenge_solutions.create!(answer: 'Kaspar Hauser', truth: true)
challenge.hints.create!(description: 'Manche Schilder in der Nähe weisen auf seinen Namen hin! Vor- und Nachnahme sind für die korrekte Antwort nötig.')

# PLACE Henkersteg
desc = 'Vom 16. bis 19. Jahrhundert wohnte im Turm und dem gedeckten Wehrgang der Scharfrichter. ' +
"Aus Sorge der Nürnberger, sich durch Körperkontakt mit dem Henker als 'unehrlich' zu infizieren, musste er dort wohnen. " +
'Im direkt anschließenden Henkerhaus ist heute ein Museum zur Nürnberger Rechtsgeschichte untergebracht, welches einen Besuch lohnt.'
p6 = Place.create(name: 'Henkersteg', description: desc, place_type: 0, city: city, lat: 49.453086, lng: 11.073051)
c = 'Man kann einen sehr schönen Blick auf ein Fachwerkgebäude am gegenüberliegenden Ufer werfen. Heute ist es ein Studentenwohnheim, doch früher war es ein Lepraspital. Wie wird es heute genannt?'
p6.challenges.create!(question: c, difficulty: 3)
challenge = p6.challenges.first
challenge.challenge_solutions.create!(answer: 'Weinstadl', truth: true)
challenge.hints.create!(description: 'Begib dich hin und befrage Personen oder Studenten in der Umgebung.')
challenge.hints.create!(description: "In dem 'Stadl' wurde früher auch einmal Wein gelagert.")

# PLACE Fleischbrücke
desc = 'An der engsten Stelle des Pegnitzdurchflusses in Nürnberg, mit den stärksten Fließkräften der Pegnitz innerhalb der Stadtmauern, befindet sich die Fleischbrücke. ' +
    'Sie wurde 1596 auf einem Fundament von mehr als 2100 Eichenpfählen erbaut, und galt somit als technische Meisterleistung. ' +
    'Durch ihre Stabilität überstand die einbogige Brücke auch Bombentreffer aus dem 2. Weltkrieg unbeschadet. ' +
    'Auf der Nordseite befinden sich die so genannten Fleischbänke, auf denen die Metzger ihre Ware verkauften. ' +
    'Vom reichsstädtischen Fleischhaus aus dem Jahr 1571 sind nur noch die unteren Außenmauern orginal erhalten geblieben.'
p7 = Place.create(name: 'Fleischbrücke', description: desc, place_type: 0, city: city, lat: 49.452887, lng: 11.076782)
c = 'Direkt im Anschluss an die Brücke befindet sich ein Portal, welches zu den Fleischbänken führt. Erkennst du, welches Tier darauf zu sehen ist?'
p7.challenges.create!(question: c, difficulty: 3)
challenge = p7.challenges.first
challenge.challenge_solutions.create!(answer: 'Ochse', truth: true)
challenge.hints.create!(description: 'Falls du latein kannst, solltest du schnell auf die Antwort kommen.')
challenge.hints.create!(description: 'Der Stier wäre in diesem Kontext nicht ganz korrekt. Das Portal grenzt direkt am historischen Fleischhaus. Welche Tiere werden denn normalerweise geschlachtet?')

tour_1 = Tour.create!(name: 'Innenstad-Nord-Tour', city: city, description: 'Diese Tour verläuft hauptsächlich im Norden der Nürnberger Altstadt. Es sind nur kurze Wege von einem Ort zum Nächsten.')
city.tours << tour_1
tour_2 = Tour.create!(name: 'Pegnitz-Tour', city: city, description: 'Diese Tour zeigt interessante Gegenden entlang der Pegniz.')
city.tours << tour_2
city.save!

tour_1.places << p1
tour_1.places << p2
tour_1.places << p8
tour_1.places << p3
tour_1.save!

tour_2.places << p4
tour_2.places << p5
tour_2.places << p6
tour_2.places << p7
tour_2.save!

# Tags
t1 = Tag.create(name: 'Fachwerkhäuser')
t2 = Tag.create(name: 'Altstadt')
t3 = Tag.create(name: 'Burgen')
t4 = Tag.create(name: 'Flüsse')
t5 = Tag.create(name: 'Brücken')

tour_1.tags << t1
tour_1.tags << t2
tour_1.tags << t3
tour_1.save!

tour_2.tags << t2
tour_2.tags << t4
tour_2.tags << t5
tour_2.save!
=end

##### Tours without challenges

tour_3 = Tour.create!(name: 'Einfache Innenstad-Tour', has_challenges: false, city: city, description: 'Diese Tour verläuft hauptsächlich im Norden der Nürnberger Altstadt. Es sind nur kurze Wege von einem Ort zum Nächsten.')
city.tours << tour_3
city.save

# PLACE Kaiserburg
desc = 'Über die Toranlage gelangt man in den äußeren Burghof - dort wird man mit einem einzigartigen Blick über die Altstadt belohnt! ' +
    'Du solltest auch einen Blick in den inneren Burgbereich werfen, der damals übrigens ausschließlich dem Kaiser während der Reichstage vorbehalten war. ' +
    'Heute kannst du hier das Kaiserburg-Museum oder den Palas besuchen, den tiefen Burggraben besichtigen oder den sogenannten Sinnweltturm besteigen.' +
    'In der Burgmauer nahe des Fünfeck-Turmes befinden sich zwei Hufabdrücke. Der Sage nach gab es einst einen Raubritter ' +
    'namens Eppelein. Kurz vor seiner Hinrichtung wurde ihm ein letzter Wunsch erfüllt. Eppelein wollte noch einmal auf seinem Pferd sitzen. ' +
    'Beim Sitzen blieb es jedoch nicht: Eppelein soll durch einen tollkühnen Sprung mit dem Pferd über den Burggraben entwischt sein - und somit die Hufabdrücke in der Burgmauer hinterlassen haben.'
tour3_p1 = Place.create!(name: 'Kaiserburg', description: desc, place_type: 1, city: city, lat: 49.457850, lng: 11.075858)

# PLACE Tiergärtnerplatz
desc = 'Nachdem du dich vom Aufstieg erholt und den Ausblick genossen hast, geht es weiter in Richtung Tiergärtnerplatz. ' +
    'Die Fachwerkhäuser blieben während des 2. Weltkriegs weitgehend verschont. ' +
    'Der Platz ist in lauen Sommernächten ein beliebter Treffpunkt für junge Leute. ' +
    'Vor dem Pilatushaus befindet sich eine Bronzeplastik. Erstellt wurde die Plastik von dem Künstler Jürgen Goertz im Jahr 1984 und wurde Albrecht Dürer gewidmet.'
tour3_p2 = Place.create(name: 'Tiergärtnertorplatz', description: desc, place_type: 1, city: city, lat: 49.457447, lng: 11.074014)

# PLACE St Sebald
desc = 'St. Sebald ist die älteste Kirche Nürnbergs. Ihren Namen hat sie vom Heiligen Sebaldus der in Nürnberg geboren wurde und auch starb. ' +
    'Sein Grab befindet sich innerhalb der Pfarrkirche, ein filigranes Werk des 16. Jahrhunderts. ' +
    'Am Sebalder Platz gleich neben der Kirche befand sich früher ein Friedhof. Das Gebäude, welches sich darin befand, kann man noch erahnen, wenn man den Platz näher erkundet. Es handelte sich um die Moritzkapelle.'
tour3_p8 = Place.create(name: 'St Sebald', description: desc, place_type: 1, city: city, lat: 49.455260, lng: 11.076602)

# PLACE Weißgerbergasse
desc = 'Etwa 20 historische Häuser haben hier den Krieg überlebt und geben eine Vorstellung vom ursprünglichen Aussehen vieler Altstadtstraßen. ' +
    'Wie der Name schon sagt, lebten in dieser Gasse vorwiegend Weißgerber, die mit Hilfe von Alaun (Kaliumaluminiumsulfat) feines Leder herstellten. ' +
    'Heute ist die Weißgerbergasse ein beliebtes Kneipenviertel. ' +
    'An einer der Häuserfronten kann man die typischen Werkzeuge der Weißgerber entdecken. Es handelt dabei sich um Stampfer und Messer.'
tour3_p3 = Place.create(name: 'Weißgerbergasse', description: desc, place_type: 1, city: city, lat: 49.455180, lng: 11.072795)

tour_3.places << tour3_p1
tour_3.places << tour3_p2
tour_3.places << tour3_p8
tour_3.places << tour3_p3
tour_3.save!


tour_4 = Tour.create!(name: 'Einfache Pegnitz-Tour', has_challenges: false, city: city, description: 'Diese Tour zeigt interessante Gegenden entlang der Pegniz.')
city.tours << tour_4
city.save

# PLACE Kettensteg
desc = 'Der Kettensteg wurde 1824 als erste frei schwebende Hängebrücke Deutschlands errichtet und misst stolze 80 Meter. Damals entsprach sie einer echten Pionierleistung. ' +
    'Ursprünglich stand dort einmal ein hölzerner Trockensteg, der bereits auf einer Federzeichnung von Albrecht Dürer abgebildet ist.'
tour4_p4 = Place.create(name: 'Kettensteg', description: desc, place_type: 1, city: city, lat: 49.454272, lng: 11.070902)

# PLACE Unschlittplatz
desc = 'Der Name des Platzes und des darauf stehenden Unschlitthauses geht zurück bis ins Jahr 1562, als dort das Unschlittamt untergebracht wurde. ' +
    'Es fungierte als städtische Monopolbehörde für nicht genießbares Abfallfett (Unschlitt). ' +
    'Alle Metzger der Stadt mussten ihren Unschlitt hier abgeben, während es die Stadt zu festen Preisen an andere Gewerbe weiterverkaufte. ' +
    'Bis ins 19. Jh. war Unschlitt ein bedeutender Rohstoff für Kerzen. ' +
    'Historische Bedeutung und Bekanntheit erlangte der Platz durch die rätselhafte Person Kaspar Hauser. Für sie wurde eigens eine Gedenktafel angebracht.'
tour4_p5 = Place.create(name: 'Unschlittplatz', description: desc, place_type: 1, city: city, lat: 49.452697, lng: 11.072204)

# PLACE Henkersteg
desc = 'Vom 16. bis 19. Jahrhundert wohnte im Turm und dem gedeckten Wehrgang der Scharfrichter. ' +
    "Aus Sorge der Nürnberger, sich durch Körperkontakt mit dem Henker als 'unehrlich' zu infizieren, musste er dort wohnen. " +
    'Im direkt anschließenden Henkerhaus ist heute ein Museum zur Nürnberger Rechtsgeschichte untergebracht, welches einen Besuch lohnt. ' +
    'Man kann einen sehr schönen Blick auf ein Fachwerkgebäude am gegenüberliegenden Ufer werfen. Heute ist der Weinstadl ein Studentenwohnheim, doch früher war es ein Lepraspital.'
tour4_p6 = Place.create(name: 'Henkersteg', description: desc, place_type: 1, city: city, lat: 49.453086, lng: 11.073051)

# PLACE Fleischbrücke
desc = 'An der engsten Stelle des Pegnitzdurchflusses in Nürnberg, mit den stärksten Fließkräften der Pegnitz innerhalb der Stadtmauern, befindet sich die Fleischbrücke. ' +
    'Sie wurde 1596 auf einem Fundament von mehr als 2100 Eichenpfählen erbaut, und galt somit als technische Meisterleistung. ' +
    'Durch ihre Stabilität überstand die einbogige Brücke auch Bombentreffer aus dem 2. Weltkrieg unbeschadet. ' +
    'Auf der Nordseite befinden sich die so genannten Fleischbänke, auf denen die Metzger ihre Ware verkauften. ' +
    'Vom reichsstädtischen Fleischhaus aus dem Jahr 1571 sind nur noch die unteren Außenmauern orginal erhalten geblieben.' +
    'Direkt im Anschluss an die Brücke befindet sich das Ochsen-Portal, welches zu den Fleischbänken führt.'
tour4_p7 = Place.create(name: 'Fleischbrücke', description: desc, place_type: 1, city: city, lat: 49.452887, lng: 11.076782)

tour_4.places << tour4_p4
tour_4.places << tour4_p5
tour_4.places << tour4_p6
tour_4.places << tour4_p7
tour_4.save!
