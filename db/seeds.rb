artists = [
  ['Thelonius Monk', 'Artist History'],
  ['Daft Punk', 'Artist History Goes Here'],
  ['Peter Tosh', 'Reggae Guy'],
  ['The Beatles', 'Some Guys from Liverpool'],
  ['Grandmaster Flash', 'Hip Hop guy']
]

artists.each do |name, history|
  Artist.create(name: name, history: history)
end
puts "Seeded Artists (ln:#{__LINE__})"

genres = [
  'Jazz',
  'Electronic',
  'Reggae',
  'Rock',
  'Hip-Hop'
]

genres.each do |genre_name|
#  genre = Genre.create(name: genre_name)
end
puts "Seeded Genres (ln:#{__LINE__})"

artist_albums = {}

# artist_albums[ ARTIST ] = [ ALBUM, RELEASE_YEAR, DURATION, DESCRIPTION ]
artist_albums['Thelonius Monk'] = ['Thelonius Himself', 1957, 3988, 'A studio album by Thelonius Monk, primarily featuring Monk on solo-piano.'],
                                  ['Solo Monk', 1965, 2435, 'Eighth album released by Thelonius Monk for Columbia Records.'],
                                  ["Monk's Music", 1957, 2304, "An album from Thelonius Monk's jazz septet."]

artist_albums['Daft Punk'] = ['Homework', 1997, 4433, 'An album'],
                             ['Discovery', 2001, 3680, 'Their second album'],
                             ['Human After All', 2005, 2738, 'Third album']

artist_albums['Peter Tosh'] = ['Bush Doctor', 1978, 2386, 'Third studio album'],
                              ['Mama Africa', 1983, 2651, 'By Peter Tosh']

artist_albums['The Beatles'] = ['Please Please Me', 1963, 1965, 'Debut album'],
                               ['Beatles for Sale', 1964, 2013, 'Another album by the Beatles'],
                               ["Sgt. Pepper's Lonely Hearts Club Band", 1967, 2392, 'Yet another album']

artist_albums['Grandmaster Flash'] = ['The Message', 1982, 2218, 'The first album'],
                                     ['The Source', 1986, 2392, 'Another album from Grandmaster Flash'],
                                     ['Flash Is Back', 1998, 3651, 'Sixth Studio Release']

artist_albums.each do |artist_name, albums|
  artist = Artist.find_by(name: artist_name)

  albums.each do |title, year, duration, description|
    album = Album.create(title: title, artist_id: artist.id,
                         release_year: year, description: description)
  end
end
puts "Seeded Albums (ln:#{__LINE__})"

album_songs = {}
# album_songs[ ALBUM_NAME ] = [ TRACK, DURATION, ARTIST_ID, ALBUM_ID ]

# Thelonius Monk
album_songs['Thelonius Himself'] = ['April in Paris', 230],
                                   ["(I don't Stand) A Ghost of a Chance (With You)", 261],
                                   ['Functional', 558],
                                   ["I'm Getting Sentimental Over You", 243],
                                   ['I Should Care', 194],

                                   ['Round Midnight', 399],
                                   ['All Alone', 289],
                                   ["Monk's Mood", 469],
                                   ['Round Midnight (in progress)', 1319]

album_songs['Solo Monk'] = ['Dinah [take 2]', 207],
                           ['I Surrender, Dear', 223],
                           ['Sweet And Lovely [take 2]', 178],
                           ['North Of The Sunset', 110],
                           ['Ruby, My Dear [take 3]', 335],

                           ["I'm Confessin' (That I Love You)", 156],
                           ["I Hadn't Anyone Till You", 197],
                           ['Everything Happens to Me [take 3]', 205],
                           ["Monk's Point", 191],
                           ['I Should Care', 116],

                           ['Ask Me Now [take 2]', 275],
                           ['These Foolish Things (Remind Me of You)', 212],
                           ['Introspection', 134],
                           ['Darn That Dream', 221],
                           ['Dinah', 145],

                           ['Sweet and Lovely', 198],
                           ['Ruby, My Dear', 288],
                           ["I'm Confessin' (That I Love You)", 164],
                           ["I Hadn't Anyone Till You", 201],
                           ['Everything Happens To Me', 320],

                           ['Ask Me Now', 223]

album_songs["Monk's Music"] = ['Abide With Me', 54],
                              ["Well, You Needn't", 684],
                              ['Ruby, My Dear', 326],
                              ['Off Minor [take 5]', 307],
                              ['Off Minor [take 4]', 312],

                              ['Epistrophy', 646],
                              ['Crepuscule With Nellie [take 6]', 278],
                              ['Crepuscule With Nellie [take 4 and 5]', 283]

# Daft Punk
album_songs['Homework'] = ['Daftendirekt', 164],
                          ['WDPK 83.7 FM', 28],
                          ['Revolution 909', 326],
                          ['Da Funk', 328],
                          ['Phoenix', 295],

                          ['Fresh', 243],
                          ['Around the World', 428],
                          ["Rollin' & Scratchin'", 446],
                          ['Teachers', 172],
                          ['High Fidelity', 360],

                          ["Rock'n Roll", 452],
                          ['Oh Yeah', 120],
                          ["Burnin'", 413],
                          ['Indo Silver Club', 272],
                          ['Alive', 315],

                          ['Funk Ad', 50]

album_songs['Discovery'] = ['One More Time', 320],
                          ['Aerodynamic', 207],
                          ['Digital Love', 298],
                          ['Harder, Better, Faster, Stronger', 225],
                          ['Crescendolls', 211],

                          ['Nightvision', 104],
                          ['Superheroes', 237],
                          ['High Life', 202],
                          ['Something About Us', 231],
                          ['Voyager', 223],

                          ['Veridis Quo', 344],
                          ['Short Circuit', 206],
                          ['Face to Face', 238],
                          ['Too Long', 600]

album_songs['Human After All'] = ['Human After All', 320],
                                 ['The Prime Time of Your Life', 263],
                                 ['Robot Rock', 288],
                                 ['Steam Machine', 321],
                                 ['Make Love', 290],

                                 ['The Brainwasher', 248],
                                 ['On/Off', 19],
                                 ['Television Rules the Nation', 288],
                                 ['Technologic', 284],
                                 ['Emotion', 417]

# Peter Tosh
album_songs['Bush Doctor'] = ["(You Gotta Walk) Don't Look Back", 223],
                             ['Pick Myself Up', 235],
                             ["I'm the Toughest", 228],
                             ["Soon Come", 234],
                             ['Moses - The Prophet', 217],

                             ['Bush Doctor', 244],
                             ['Stand Firm', 370],
                             ["Dem Ha Fe Get A Beatin'", 251],
                             ['Creation', 389]

album_songs['Mama Africa'] = ['Mama Africa', 476],
                             ['Glass House', 352],
                             ['Not Gonna Give It Up', 348],
                             ['Stop That Train', 242],
                             ['Johnny B. Goode', 244],

                             ['Where You Gonna Run', 249],
                             ['Peace Treact', 261],
                             ['Feel No Way', 211],
                             ['Maga Dog', 270]

# The Beatles
album_songs['Please Please Me'] = ['I Saw Her Standing There', 175],
                                  ['Misery', 109],
                                  ['Anna (Go to Him)', 175],
                                  ['Chains', 143],
                                  ['Boys', 144],

                                  ['Ask Me Why', 144],
                                  ['Please Please Me', 120],
                                  ['Love Me Do', 143],
                                  ['P.S I Love You', 124],
                                  ["Baby It's You", 160],

                                  ['Do You Want to Know a Secret?', 116],
                                  ['A Taste of Honey', 123],
                                  ["There's a Place", 111],
                                  ['Twist and Shout', 152]

album_songs['Beatles for Sale'] = ['No Reply', 135],
                                  ["I'm a Loser", 151],
                                  ["Baby's in Black", 122],
                                  ['Rock and Roll Music', 152],
                                  ["I'll Follow the Sun", 106],

                                  ['Mr. Moonlight', 153],
                                  ['Kansas City/Hey, Hey, Hey, Hey', 153],
                                  ['Eight Days a Week', 164],
                                  ['Words of Love', 132],
                                  ["Honey Don't", 175],

                                  ['Every Little Thing', 121],
                                  ["I Don't Want to Spoil the Party", 153],
                                  ["What You're Doing", 150],
                                  ["Everybody's Trying to Be My Baby", 143]

album_songs["Sgt. Pepper's Lonely Hearts Club Band"] = ["Sgt. Pepper's Lonely Hearts Club Band", 122],
                                                       ['With a Little Helpf From My Friends', 164],
                                                       ['Lucy in the Sky with Diamonds', 208],
                                                       ['Getting Better', 168],
                                                       ['Fixing a Hole', 156],

                                                       ["She's Leaving Home", 215],
                                                       ['Being for the Benefit of Mr. Kite!', 157],
                                                       ['Within You Without You', 304],
                                                       ["When I'm Sixty-Four", 157],
                                                       ['Lovely Rita', 162],

                                                       ['Good Morning Good Morning', 161],
                                                       ["Sgt. Pepper's Lonely Hearts Club Band (Reprise)", 79],
                                                       ['A Day in the Life', 339]

# Grandmaster Flash
album_songs['The Message'] = ["She's Fresh", 297],
                             ["It's Nasty", 259],
                             ['Scorpio', 295],
                             ["It's a Shame (Mt. Airy Groove)", 297],
                             ["Dreamin'", 347],

                             ['You Are', 291],
                             ['The Message', 432]

album_songs['The Source'] = ['Street Scene', 186],
                            ['Style (Peter Gunn Theme)', 237],
                            ['Ms. Thang', 235],
                            ['P.L.U. (Peach, Love and Unity)', 237],
                            ["Throwin' Down", 225],

                            ['Behind Closed Doors', 219],
                            ["Larry's Dance Theme (part 2)", 211],
                            ['Lies', 212],
                            ['Fastest Man Alive', 322],
                            ['Freelance', 308]

album_songs['Flash Is Back'] = ['Groove To Get Down', 254],
                               ['Gotta Get Busy', 293],
                               ["Whatever the Hell it's Working", 320],
                               ['This is the Way', 270],
                               ['Sex on the Scratch', 293],

                               ['Coolcuts', 295],
                               ["Let's Have Some Action", 176],
                               ['Brothers Be Fronting', 175],
                               ['Flashes Theme', 231],
                               ['Little Bit of Flash', 484],

                               ['Flash is Back', 327],
                               ['Dance to the Beat', 530]

album_songs.each do |album_title, songs|
  album = Album.find_by(title: album_title)

  puts "#{album} being seeded with id:#{album.id} and title:#{album.title}"
  songs.each do |track, duration|
     album.id
    song = Song.create(track: track,
                       duration: duration,
                       album_id: album.id)
                 #      artist_id: album.artist_id)
  end
end
puts "Seeded Songs (ln:#{__LINE__})"
