# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chris = User.create(email: 'cserpa123@gmail.com', password: 'devise', first_name: 'Chris', last_name: 'Serpa', role: 'admin')
Figure.create(name: 'Harambe', occupation: 'Gorilla', era: '1999-2016', nationality: 'American', claim_to_fame: 'Died for our sins', user_id: chris.id)
Figure.create(name: 'Luke Skywalker', occupation: 'Jedi', era: 'Long, long time ago', nationality: 'Tatooine', claim_to_fame: 'Killed his dad, made out with his sister', user_id: chris.id)
Figure.create(name: 'Genghis Khan', occupation: 'Emperor', era: 'early 1200s', nationality: 'Mongolian', claim_to_fame: 'Established the Mongol Empire', user_id: chris.id)
Figure.create(name: 'Ghandi', occupation: 'Activist', era: '1869-1948', nationality: 'Indian', claim_to_fame: 'Peace activist who led India to independence', user_id: chris.id)
Figure.create(name: 'Napoleon', occupation: 'Emperor of France', era: 'French Revolution', nationality: 'French', claim_to_fame: 'One of the most celebrated military leaders in history', user_id: chris.id)

cameron = User.create(email: 'cameron@example.com', password: 'devise', first_name: 'Cameron', last_name: 'Cogan', role: 'admin')
Figure.create(name: 'Abraham Lincoln', occupation: 'President of the United States', era: '1809-1865', nationality: 'American', claim_to_fame: 'Won the Civil War, abolished slavery', user_id: cameron.id)
Figure.create(name: 'George Washington', occupation: 'President of the United States', era: '1732-1799', nationality: 'American', claim_to_fame: 'First President of the United States', user_id: cameron.id)
Figure.create(name: 'Joan of Arc', occupation: 'Military Leader', era: 'early 1400s', nationality: 'French', claim_to_fame: 'Helped end Hundred Years War, Martyr', user_id: cameron.id)
Figure.create(name: 'William Shakespeare', occupation: 'Playwright', era: 'late 1500s-early 1600s', nationality: 'English', claim_to_fame: 'Widely regarded as greatest writer in English language history', user_id: cameron.id)
Figure.create(name: 'Hitler', occupation: 'Politician', era: '1889-1945', nationality: 'Austrian', claim_to_fame: 'Genocide, total asshole', user_id: cameron.id)

myles = User.create(email: 'myles@example.com', password: 'devise', first_name: 'Myles', last_name: 'Olson', role: 'admin')
Figure.create(name: 'Alexander the Great', occupation: 'Monarch', era: '~300 BC', nationality: 'Greek', claim_to_fame: 'Built one of the largest empires of the ancient world', user_id: myles.id)
Figure.create(name: 'Aristotle', occupation: 'Teacher, Philospher', era: '~300 BC', nationality: 'Greek', claim_to_fame: 'Influneced philosophy and science for thousands of years', user_id: myles.id)
Figure.create(name: 'Henry VIII', occupation: 'King of England', era: 'early 1500s', nationality: 'English', claim_to_fame: 'Married six times', user_id: myles.id)
Figure.create(name: 'Charles Darwin', occupation: 'Biologist', era: '1809-1882', nationality: 'English', claim_to_fame: 'Developed Theory of Natural Selection', user_id: myles.id)
Figure.create(name: 'Julius Caesar', occupation: 'Politician', era: 'early Roman Empire', nationality: 'Roman', claim_to_fame: 'Dictator of Roman Republic', user_id: myles.id)

zach = User.create(email: 'zach@example.com', password: 'devise', first_name: 'Zachary', last_name: 'Cutler', role: 'admin')
Figure.create(name: 'Martin Luther King Jr.', occupation: 'Activist', era: '1929-1968', nationality: 'American', claim_to_fame: 'Leader of the African-American Civil Rights Movement', user_id: zach.id)
Figure.create(name: 'Albert Einstein', occupation: 'Theoretical Physicist', era: '1879-1955', nationality: 'German', claim_to_fame: 'Developed Theory of Relativity', user_id: zach.id)
Figure.create(name: 'Theodore Roosevelt', occupation: 'President', era: '1858-1919', nationality: 'American', claim_to_fame: 'A real MAN', user_id: zach.id)
Figure.create(name: 'Leonardo da Vinci', occupation: 'Renaissance Man', era: 'late 1400s', nationality: 'Italian', claim_to_fame: 'Inventor, painter, sculptor, architect, scientist, mathemitician, author, botanist...', user_id: zach.id)
Figure.create(name: 'Sigmund Freud', occupation: 'Psychoanalyst', era: '1856-1939', nationality: 'Austrian', claim_to_fame: 'Invented psychoanalysis', user_id: zach.id)
