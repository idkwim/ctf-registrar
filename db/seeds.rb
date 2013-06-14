# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'bcrypt'
categories = {}

[
  "3dub", # web
  "0x41414141", # exploitation
  "\\xff\\xe4\\xcc", # shellcode
  "OMGACM", # guerilla programming
  "gnireenigne", # reverse engineering
].each_with_index do |name, order|
  categories[name] = Category.where(name: name, order: order).first_or_create
end

p = proc{|a| BCrypt::Password.create a}

fart = "$2a$10$/tcBNuCm5oCxpuzfUeq8luZFS/Rk.IoOVsyVzcdSX7.uXxcI4Dlj6"

categories['3dub'].challenges.create(
                                    name: 'babysfirst',
                                    clue: 'http://babysfirst.shallweplayaga.me/',
                                    answer_digest: p['literally online lolling on line WucGesJi'],
                                    points: 2
                                    )
categories['3dub'].challenges.create(
                                     name: 'badmedicine',
                                     clue: 'http://badmedicine.shallweplayaga.me/',
                                     answer_digest: p['who wants oatmeal raisin anyways twumpAdby'],
                                     points: 1
                                     )
categories['3dub'].challenges.create(
                                     name: 'hypeman',
                                     clue: 'http://hypeman.shallweplayaga.me/',
                                     answer_digest: p['watch out for this Etdeksogav'],
                                     points: 3
                                     )
categories['3dub'].challenges.create(
                                     name: 'rememberme',
                                     clue: 'http://rememberme.shallweplayaga.me/',
                                     answer_digest: p['DyacphakukKefumsh2SwalvyocfowgitenhonEaf'],
                                     points: 4
                                     )
categories['3dub'].challenges.create(
                                     name: 'worsemedicine',
                                     clue: 'http://worsemedicine.shallweplayaga.me/',
                                     answer_digest: 'x',
                                     points: 5
                                     )

categories['OMGACM'].challenges.create(
                                       name: 'pieceofeight',
                                       clue: 'squaaak, pieces of eight. pieceofeight.shallweplayaga.me:8273',
                                       answer_digest: p['enemas on parade'],
                                       points: 1
                                           )
categories['OMGACM'].challenges.create(
                                       name: 'grandprix',
                                       clue: 'stay away from the zebras. grandprix.shallweplayaga.me:2038',
                                       answer_digest: p['all our prix belong to you'],
                                       points: 3
                                           )
categories['OMGACM'].challenges.create(
                                       name: 'passweird',
                                       points: 4
                                           )
categories['OMGACM'].challenges.create(
                                       name: 'diehard',
                                       clue: '...with a vengeance. diehard.shallweplayaga.me:4001',
                                       answer_digest: p['yippie kay yay motherfucker 3nc83n89fg'],
                                       points: 2
                                           )
categories['OMGACM'].challenges.create(
                                       name: 'bob',
                                       points: 5
                                           )

bitter = categories['0x41414141'].challenges.create(
                                       name: 'bitterswallow',
                                       clue: 'bitterswallow.shallweplayaga.me:6492 http://assets-2013.legitbs.net/liabilities/bs',
                                       answer_digest: p['sometimes you just have to suck it up.'],
                                       points: 1
                                           )

bitter.unlock!
categories['0x41414141'].challenges.create(
                                       name: 'blackbox',
                                       clue: "http://assets-2013.legitbs.net/liabilities/blackbox.core\nRunning at 131.247.27.201:1234",
                                       answer_digest: p['arm+bsd=shellcoding fun']
                                       points: 2
                                           )
categories['0x41414141'].challenges.create(
                                       name: 'ergab',
                                       clue: "Don't worry, I'm the Doctor. 131.247.27.199:5000 [[server binary]]",
                                       answer_digest: 'fart',
                                       points: 3
                                           )
categories['0x41414141'].challenges.create(
                                       name: 'annyong',
                                       clue: "HELLOHellohello\nhttp://assets-2013.legitbs.net/liabilities/annyong\nRunning at annyong.shallweplayaga.me:5679",
                                       answer_digest: p['Kernel airbags have been fully deployed'],
                                       points: 4
                                           )
categories['0x41414141'].challenges.create(
                                       name: 'yolo',
                                       clue: 'usually, sometimes 12 times. 23.20.98.29:3647 http://assets-2013.legitbs.net/liabilities/yolo',
                                       answer_digest: p['it is not an excuse to be a slut'],
                                       points: 5
                                           )

categories['\\xff\\xe4\\xcc'].challenges.create(
                                                name: 'blackjack',
                                                clue: "Are you ready to win some $$?\n[[server binary]]\nRunning at blackjack.shallweplayaga.me:6789",
                                                answer_digest: p['Counting cards will get you banned from the casino'],
                                                points: 2
                                                )
categories['\\xff\\xe4\\xcc'].challenges.create(
                                                name: 'linked', 
                                                points: 3
                                                )
categories['\\xff\\xe4\\xcc'].challenges.create(
                                                name: 'penser',
                                                clue: 'good luck. penser.shallweplayaga.me:4660 http://assets-2013.legitbs.net/liabilities/penser',
                                                points: 4
                                                )
categories['\\xff\\xe4\\xcc'].challenges.create(
                                                name: 'lena',
                                                points: 5
                                                )
categories['\\xff\\xe4\\xcc'].challenges.create(
                                                name: 'incest',
                                                points: 1
                                                )

categories['gnireenigne'].challenges.create(
                                                name: 'musicman',
                                                clue: "Can you hear that?\n[[server binary]]\nRunning at musicman.shallweplayaga.me:7890",
                                                answer_digest: p['We make beautiful music together'],
                                                points: 3
                                                )
categories['gnireenigne'].challenges.create(
                                                name: 'policebox',
                                                clue: "But I already typed that..."
                                                answer_digest: p['w0rlds.w0rst.k3yl0gger!']
                                                points: 1
                                                )
categories['gnireenigne'].challenges.create(
                                                name: 'thyself',
                                                clue: "usage: ./client 50.16.112.8\nhttp://assets-2013.legitbs.net/liabilities/client",
                                                answer_digest: p['Good enough for government work'],
                                                points: 2
                                                )
categories['gnireenigne'].challenges.create(
                                                name: 'timecubed',
                                                points: 4
                                                )

categories['gnireenigne'].challenges.create(
                                                name: 'tastycloud',
                                                points: 5,
                                                clue: "mmmmm. [[server binary]]",
                                                answer_digest: p['pringlelingus and redbull without a cause']
                                                )
