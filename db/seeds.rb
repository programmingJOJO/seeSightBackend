country = Country.find_or_create_by!(name: 'Deutschland', iso_code: 'de')
city = City.find_or_build_city('Nürnberg')
city.update_attributes!(lat: 49.45052, lng: 11.08048)
country.cities << city
country.save!

tour = Tour.create!(name: 'Altstadt-Tour', city: city, description: 'Diese Tour verläuft hauptsächlich in der Nürnberger Altstadt. Es sind nur kurze Wege von einem Ort zum Nächsten.')
city.tours << tour
city.save!

# PLACE Kaiserburg
desc = 'Über die Toranlage gelangt man in den äußeren Burghof - dort wird man einem einzigartigen Blick über die Altstadt belohnt!' +
'Du solltest auch einen Blick in den inneren Burgbereich werfen, der damals übrigens ausschließlich dem Kaiser während der Reichstage vorbehalten war.' +
'Heute kannst du hier das Kaiserburg-Museum oder den Palas besuchen, den tiefen Burggraben besichtigen oder den sogenannten Sinnweltturm besteigen.'
p1 = Place.create!(name: 'Kaiserburg', description: desc, place_type: 0, city: city, lat: 49.457850, lng: 11.075858)
c = 'In der Burgmauer nahe des Fünfeck-Turmes befinden zwei Hufabdrücke. Der Sage nach gab es einst einen Raubritter' +
    'namens Eppelein. Kurz vor seiner Hinrichtung wurde ihm ein letzter Wunsch erfüllt. Eppelein wollte noch einmal auf seinem Pferd sitzen' +
    'Beim Sitzen blieb es jedoch nicht: Eppelein soll durch einen tollkühnen Sprung mit dem Pferd entwischt sein - und somit die Hufabdrücke in der Burgmauer hinterlassen haben.' +
    'Über was sprang Eppelein mt seinem Pferd?'
p1.challenges.create!(question: c, difficulty: 2)
challenge = p1.challenges.first
challenge.challenge_solutions.create!(answer: 'Die Stadtmauer', truth: false)
challenge.challenge_solutions.create!(answer: 'Den Schafott', truth: false)
challenge.challenge_solutions.create!(answer: 'Den Burggraben', truth: true)

# PLACE Tiergärtnerplatz
desc = 'Nachdem Sie sich vom Aufstieg erholt und den Ausblick genossen haben, geht es weiter in Richtung Tiergärtnerplatz.' +
'Der Platz ist in lauen Sommernächten ein beliebter Treffpunkt für junge Leute.' +
'Dieser soll auf Dürers berühmtes Aquarell Bezug nehmen. Erstellt wurde die Plastik von dem Künstler Jürgen Goertz im Jahr 1984.'
p2 = Place.create(name: 'Tiergärtnertorplatz', description: desc, place_type: 0, city: city, lat: 49.457447, lng: 11.074014)
c = 'Vor dem Pilatushaus befindet sich eine Bronzeplastik. Welchem Künstler wurde sie gewidmet?'
p2.challenges.create!(question: c, difficulty: 1)
challenge = p2.challenges.first
challenge.challenge_solutions.create!(answer: 'Dürer', truth: true)

# PLACE Weißgerbergasse
desc = 'Etwa 20 historische Häuser haben hier den Krieg überlebt und geben eine Vorstellung vom ursprünglichen Aussehen vieler Altstadtstraßen.' +
'Wie der Name schon sagt, lebten in dieser GAsse vorwiegend Weißgerber, die mit Hilfe von Alaun (Kaliumaluminiumsulfat) feines Leder herstellten.' +
    'Heute ist die Weißgerbergasse ein beliebtes Kneipenviertel.'
p3 = Place.create(name: 'Weißgerbergasse', description: desc, place_type: 0, city: city, lat: 49.457447, lng: 11.074014)
c = 'An einer der Häuserfronten kann man die typischen Werkzeuge der Weißgerber entdecken. Finde sie und erzähle uns, was neben dem Stampfer noch abgebildet ist!'
p3.challenges.create!(question: c, difficulty: 3)
challenge = p3.challenges.first
challenge.challenge_solutions.create!(answer: 'Messer', truth: true)
challenge.hints.create!(description: 'Die Werkzeuge sind an dem Haus mit der Hausnummer 24 zu finden.')

# PLACE Kettensteg
desc = 'Der Kettensteg wurde 1824 gebaut und misst ganze 80 Meter. Damals entsprach sie einer echten Pionierleistung' +
    'Ursprünglich stand dort einmal ein hölzerner Trockensteg, der bereits auf einer Federzeichnung von Albrecht Dürer abgebildet ist.'
p4 = Place.create(name: 'Kettensteg', description: desc, place_type: 0, city: city, lat: 49.457447, lng: 11.074014)
c = 'Die Hängebrücke ist schon sehr alt. Sie ist die älteste erhaltene eiserne Hängebrücke ...'
p4.challenges.create!(question: c)
challenge = p4.challenges.first
challenge.challenge_solutions.create!(answer: 'Bayerns!', truth: false)
challenge.challenge_solutions.create!(answer: 'Nein, Deutschlands!', truth: false)
challenge.challenge_solutions.create!(answer: 'Von wegen. Europas!', truth: true)
challenge.hints.create!(description: 'Wurde schon erwähnt wie überaus alt die Brücke ist?')

# PLACE Unschlittplatz
desc = 'Der Name des Platzes und des darauf stehenden Unschlitthauses geht zurück bis ins Jahr 1562, als dort das Unschlittamt untergebracht wurde.' +
    'Es fungierte als städtische Monopolbehörde für nicht genießbares Abfallfett (Unschlitt).' +
    'Alle Metzger der Stadt mussten ihren Unschlitt hier abgeben, während es die Stadt zu festen Preisen an andere Gewerbe weiterverkaufte.' +
'Bis ins 19. Jh. war Unschlitt ein bedeutender Rohstoff für Kerzen.'
p5 = Place.create(name: 'Unschlittplatz', description: desc, place_type: 0, city: city, lat: 49.452697, lng: 11.072204)
c = 'Historische Bedeutung und Bekanntheit erlangte der Platz durch eine rätselhafte Person. Für sie wurde eigens eine Gedenktafel angebracht. Um wen handelt es sich?'
p5.challenges.create!(question: c)
challenge = p5.challenges.first
challenge.challenge_solutions.create!(answer: 'Kaspar Hauser', truth: true)
challenge.hints.create!(description: 'Manche Schilder in der Nähe weisen auf seinen Namen hin!')

# PLACE Henkersteg
desc = 'Vom 16. bis 19. Jh. wohnte im Turm und dem dedeckten Wehrgang der Scharfrichter.' +
"Aus Sorge der Nürnberger, sich durch Körperkontakt mit dem Henker als 'unehrlich' zu infizieren"
'Im direkt anschließenden Henkerhaus ist heute ein Museum untergebracht, welches einen Besuch lohnt.'
p6 = Place.create(name: 'Henkersteg', description: desc, place_type: 0, city: city, lat: 49.453086, lng: 11.073051)
c = 'Man kann einen sehr schönen Blick auf ein Fachwerkgebäude am gegenüberliegenden Ufer werfen. Wie heißt dieses Gebäude?'
p6.challenges.create!(question: c, difficulty: 3)
challenge = p6.challenges.first
challenge.challenge_solutions.create!(answer: "Weinstadl", truth: true)
challenge.hints.create!(description: 'Heute ist ein ein Studentenwohnheim, doch früher lebten Leprakranke darin.')

# PLACE Fleischbänke
desc = 'Die Fleischbrücke ist nach dem Vorbild der Ponte die Rialot in Venedig erbaut.' +
    'Noch heute steht sie auf einem Fundament von mehr als 2000 Eichenpfählen.' +
    'Die einbogige Brücke galt somit als technische Meisterleistung.' +
    'Auf der Nordseite befinden sich die so genannten Fleischbänke, auf denen die Metzger ihre Ware verkauften.' +
    'Vom reichsstädtischen Fleischhaus aus dem Jahr 1571 sind nur noch die unteren Außenmauern orginal erhalten geblieben.'
p7 = Place.create(name: 'An den Fleischbänken', description: desc, place_type: 0, city: city, lat: 49.453086, lng: 11.073051)

tour.places << p1
tour.places << p2
tour.places << p3
tour.places << p4
tour.places << p5
tour.places << p6
tour.places << p7
tour.save!


Tag.create(name: 'historisch')
Tag.create(name: 'Altstad')

tour.tags << Tag.all
tour.save!



