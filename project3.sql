DROP TABLE director CASCADE CONSTRAINTS;
DROP TABLE writer CASCADE CONSTRAINTS;
DROP TABLE actor CASCADE CONSTRAINTS;
DROP TABLE directs_tv_show CASCADE CONSTRAINTS;
DROP TABLE acts_tv_show CASCADE CONSTRAINTS;
DROP TABLE writes_tv_show CASCADE CONSTRAINTS;
DROP TABLE directs_movie CASCADE CONSTRAINTS;
DROP TABLE acts_movie CASCADE CONSTRAINTS;
DROP TABLE writes_movie CASCADE CONSTRAINTS;
DROP TABLE episode CASCADE CONSTRAINTS;
DROP TABLE tv_show CASCADE CONSTRAINTS;
DROP TABLE tv_show_streaming_service CASCADE CONSTRAINTS;
DROP TABLE tv_show_genre CASCADE CONSTRAINTS;
DROP TABLE movie CASCADE CONSTRAINTS;
DROP TABLE movie_streaming_service CASCADE CONSTRAINTS;
DROP TABLE movie_genre CASCADE CONSTRAINTS;

CREATE TABLE director (
name VARCHAR2 (30) CONSTRAINT director_name_pk PRIMARY KEY,
description CLOB,
dob DATE,
dod DATE
);

CREATE TABLE writer (
name VARCHAR2 (30) CONSTRAINT writer_name_pk PRIMARY KEY,
description CLOB,
dob DATE,
dod DATE
);

CREATE TABLE actor (
name VARCHAR2 (30) CONSTRAINT actor_name_pk PRIMARY KEY,
description CLOB,
dob DATE,
dod DATE
);

CREATE TABLE directs_tv_show (
tv_show_id VARCHAR2 (20),
director_name VARCHAR2 (30),
CONSTRAINT directs_tv_id_dir_name_pk PRIMARY KEY (tv_show_id, director_name)
);

CREATE TABLE acts_tv_show (
tv_show_id VARCHAR2 (20),
actor_name VARCHAR2 (30),
CONSTRAINT acts_tv_id_act_name_pk PRIMARY KEY (tv_show_id, actor_name)
);

CREATE TABLE writes_tv_show (
tv_show_id VARCHAR2 (20),
writer_name VARCHAR2 (30),
CONSTRAINT writes_tv_id_wr_name_pk PRIMARY KEY (tv_show_id, writer_name)
);

CREATE TABLE directs_movie (
movie_id VARCHAR2 (20),
director_name VARCHAR2 (30),
CONSTRAINT directs_id_dir_name_pk PRIMARY KEY (movie_id, director_name)
);

CREATE TABLE acts_movie (
movie_id VARCHAR2 (20),
actor_name VARCHAR2 (30),
CONSTRAINT acts_id_act_name_pk PRIMARY KEY (movie_id, actor_name)
);

CREATE TABLE writes_movie (
movie_id VARCHAR2 (20),
writer_name VARCHAR2 (30),
CONSTRAINT writes_id_wri_name_pk PRIMARY KEY (movie_id, writer_name)
);

CREATE TABLE episode (
tv_show_id VARCHAR2 (20),
season_number NUMBER (2),
episode_number NUMBER (2),
name VARCHAR2 (50),
length CHAR (5),
description CLOB,
initial_air_date DATE,
CONSTRAINT episode_id_sn_en_pk PRIMARY KEY (tv_show_id, season_number, episode_number)
);

CREATE TABLE tv_show (
id VARCHAR2 (20) CONSTRAINT tv_show_id_pk PRIMARY KEY,
description CLOB,
tv_show_name VARCHAR2 (30)
);

CREATE TABLE tv_show_streaming_service (
tv_show_id VARCHAR2 (20),
streaming_service VARCHAR (30),
CONSTRAINT tv_id_ss_pk PRIMARY KEY (tv_show_id, streaming_service)
);

CREATE TABLE tv_show_genre (
tv_show_id VARCHAR2 (20),
genre VARCHAR (30),
CONSTRAINT tv_id_genre_pk PRIMARY KEY (tv_show_id, genre)
);

CREATE TABLE movie (
id VARCHAR2 (20) CONSTRAINT movie_id_pk PRIMARY KEY,
movie_name VARCHAR2 (30),
description CLOB,
duration NUMBER(4),
rating NUMBER(2,1)
);

CREATE TABLE movie_streaming_service (
movie_id VARCHAR2 (20),
streaming_service VARCHAR (30),
CONSTRAINT movie_id_ss_pk PRIMARY KEY (movie_id, streaming_service)
);

CREATE TABLE movie_genre (
movie_id VARCHAR2 (20),
genre VARCHAR (30),
CONSTRAINT movie_id_genre_pk PRIMARY KEY (movie_id, genre)
);


ALTER TABLE directs_tv_show
ADD CONSTRAINT directs_tv_show_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

ALTER TABLE acts_tv_show
ADD CONSTRAINT acts_tv_show_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

ALTER TABLE writes_tv_show
ADD CONSTRAINT writes_tv_show_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

ALTER TABLE writes_movie
ADD CONSTRAINT writes_movie_id_fk FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE acts_movie
ADD CONSTRAINT acts_movie_id_fk FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE directs_movie
ADD CONSTRAINT directs_movie_id_fk FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE movie_genre
ADD CONSTRAINT movie_genre_id_fk FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE movie_streaming_service
ADD CONSTRAINT movie_ss_id_fk FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE tv_show_genre
ADD CONSTRAINT tv_show_genre_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

ALTER TABLE tv_show_streaming_service
ADD CONSTRAINT tv_show_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

ALTER TABLE episode
ADD CONSTRAINT episode_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

insert into director (name, description, dob, dod)
values ('Frank Darabont', 'Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production assistant on the 1981 low-budget film, Hell Night (1981), starring Linda Blair. He spent the next six years working in the art department as a set dresser and in set construction while struggling to establish himself as a writer. His first produced writing credit (shared) was on the 1987 film, A Nightmare on Elm Street 3: Dream Warriors (1987), directed by Chuck Russell. Darabont is one of only six filmmakers in history with the unique distinction of having his first two feature films receive nominations for the Best Picture Academy Award: 1994s The Shawshank Redemption (1994) (with a total of seven nominations) and 1999s The Green Mile (1999) (four nominations). Darabont himself collected Oscar nominations for Best Adapted Screenplay for each film (both based on works by Stephen King), as well as nominations for both films fro
m the Directors Guild of America, and a nomination from the Writers Guild of America for The Shawshank Redemption (1994).', TO_DATE('1959-01-28', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values ('Francis Ford Coppola', 'Francis Ford Coppola was born in 1939 in Detroit, Michigan, but grew up in a New York suburb in a creative, supportive Italian-American 
family. His father, Carmine Coppola, was a composer and musician. His mother, Italia Coppola (née Pennino), had been an actress. Francis Ford Coppola graduated with a 
degree in drama from Hofstra University, and did graduate work at UCLA in filmmaking. He was training as assistant with filmmaker Roger Corman, working in such 
capacities as sound-man, dialogue director, associate producer and, eventually, director of Dementia 13 (1963), Coppola s first feature film. During the next 
four years, Coppola was involved in a variety of script collaborations, including writing an adaptation of "This Property is Condemned" by Tennessee Williams 
(with Fred Coe and Edith Sommer), and screenplays for Is Paris Burning? (1966) and Patton (1970), the film for which Coppola won a Best Original Screenplay Academy 
Award. In 1966, Coppola s 2nd film brought him critical acclaim and a Master of Fine Arts degree. In 1969, Coppola and George Lucas established American Zoetrope, an 
ndependent film production company based in San Francisco. The company s first project was THX 1138 (1971), produced by Coppola and directed by Lucas. Coppola also 
produced the second film that Lucas directed, American Graffiti (1973), in 1973. This movie got five Academy Award nominations, including one for Best Picture. In 1971, 
Coppola s film The Godfather (1972) became one of the highest-grossing movies in history and brought him an Oscar for writing the screenplay with Mario Puzo The film was 
a Best Picture Academy Award-winner, and also brought Coppola a Best Director Oscar nomination. Following his work on the screenplay for The Great Gatsby (1974), Coppola 
s next film was The Conversation (1974), which was honored with the Golden Palm Award at the Cannes Film Festival, and brought Coppola Best Picture and Best Original 
Screenplay Oscar nominations. Also released that year, The Godfather Part II (1974), rivaled the success of The Godfather (1972), and won six Academy Awards, bringing 
oppola Oscars as a producer, director and writer. Coppola then began work on his most ambitious film, Apocalypse Now (1979), a Vietnam War epic that was inspired by 
Joseph Conrad s Heart of Darkness (1993). Released in 1979, the acclaimed film won a Golden Palm Award at the Cannes Film Festival, and two Academy Awards. Also that 
year, Coppola executive produced the hit The Black Stallion (1979). With George Lucas, Coppola executive produced Kagemusha: The Shadow Warrior (1980), directed by Akira 
Kurosawa, and Mishima: A Life in Four Chapters (1985), directed by Paul Schrader and based on the life and writings of Yukio Mishima. Coppola also executive produced 
such films as The Escape Artist (1982), Hammett (1982) The Black Stallion Returns (1983), Barfly (1987), Wind (1992), The Secret Garden (1993), etc.', TO_DATE('1939-04-07', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values ('Jared Hess','Jared Lawrence Hess and Jerusha Elizabeth Hess (née Demke; born May 12, 1980) are husband-and-wife American filmmakers best known for their work on Napoleon Dynamite (2004), Nacho Libre (2006) and Gentlemen Broncos (2009), all of which they co-wrote and which were directed by Jared (Nacho Libre was co-written with Mike White). They 
also produced music videos for The Postal Services third single, "We Will Become Silhouettes", and 
The Killers Christmas charity single "Boots".', TO_DATE('1979-07-18', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values ('Robert Zemeckis', 'A whiz-kid with special effects, Robert is from the Spielberg camp of film-making 
(Steven Spielberg produced many of his films). Usually working with writing partner Bob Gale, Roberts earlier 
films show he has a talent for zany comedy (Romancing the Stone (1984), 1941 (1979)) and special effect vehicles 
(Who Framed Roger Rabbit (1988) and Back to the Future (1985)). His later films have become more serious, with 
the hugely successful Tom Hanks vehicle Forrest Gump (1994) and the Jodie Foster film Contact (1997), both 
critically acclaimed movies. Again, these films incorporate stunning effects. Robert has proved 
he can work a serious story around great effects.', TO_DATE('1951-05-14', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values ('Christopher Nolan', 'Best known for his cerebral, often nonlinear, storytelling, acclaimed Academy Award winner writer/director/producer Sir Christopher Nolan CBE was born in London, England. Over the course of more than 25 years of filmmaking, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made and became one of the most celebrated filmmakers of modern cinema.
At 7 years old, Nolan began making short films with his father s Super-8 camera. While studying English Literature at University College London, he shot 16-millimeter films at U.C.L. s film society, where he learned the guerrilla techniques he would later use to make his first feature, Following (1998), on a budget of around $6,000. The noir thriller was recognized at a number of international film festivals prior to its theatrical release and gained Nolan enough credibility that he was able to gather substantial financing for his next film.
Nolan s second film was Memento (2000), which he directed from his own screenplay based on a short story by his brother Jonathan Nolan. Starring Guy Pearce, the film brought Nolan numerous honors, including Academy Award and Golden Globe Award nominations for Best Original Screenplay. Nolan went on to direct the critically acclaimed psychological thriller, Insomnia (2002), starring Al Pacino, Robin Williams and Hilary Swank.
The turning point in Nolan s career occurred when he was awarded the chance to revive the Batman franchise in 2005. In Batman Begins (2005), Nolan brought a level of gravitas back to the iconic hero, and his gritty, modern interpretation was greeted with praise from fans and critics alike. Before moving on to a Batman sequel, Nolan directed, co-wrote, and produced the mystery thriller The Prestige (2006), starring Christian Bale and Hugh Jackman as magicians whose obsessive rivalry leads to tragedy and murder.
', TO_DATE('1970-07-30', 'YYYY-MM-DD'), NULL);

insert into actor (name, description, dob, dod)
values('Tim Robbins', 'Born in West Covina, California, but raised in New York City, Tim Robbins is the son of former The Highwaymen singer Gil Robbins and actress Mary Robbins (née Bledsoe). Robbins studied drama at UCLA, where he graduated with honors in 1981. That same year, he formed the Actors'' Gang theater group, an experimental ensemble that expressed radical political observations through the European avant-garde form of theater. He started film work in television movies in 1983, but hit the big time in 1988 with his portrayal of dimwitted fastball pitcher "Nuke" Laloosh in Bull Durham (1988). Tall with baby-faced looks, he has the ability to play naive and obtuse (Cadillac Man (1990) and The Hudsucker Proxy (1994)) or slick and shrewd (The Player (1992) and Bob Roberts (1992)).
- IMDb Mini Biography By: Ray Hamel', TO_DATE('1958-10-16', 'YYYY-MM-DD'), NULL);
insert into actor (name, description, dob, dod)
values('Marlon Brando', 'Marlon Brando is widely considered the greatest movie actor of all time, rivaled only by the more theatrically oriented Laurence Olivier in terms of esteem. Unlike Olivier, who preferred the stage to the screen, Brando concentrated his talents on movies after bidding the Broadway stage adieu in 1949, a decision for which he was severely criticized when his star began to dim in the 1960s and he was excoriated for squandering his talents. No actor ever exerted such a profound influence on succeeding generations of actors as did Brando. More than 50 years after he first scorched the screen as Stanley Kowalski in the movie version of Tennessee Williams'' A Streetcar Named Desire (1951) and a quarter-century after his last great performance as Col. Kurtz in Francis Ford Coppola''s Apocalypse Now (1979), all American actors are still being measured by the yardstick that was Brando. It was if the shadow of John Barrymore, the great American actor closest to Brando in terms of talent and stardom, dominated the acting field up until the 1970s. He did not, nor did any other actor so dominate the public''s consciousness of what WAS an actor before or since Brando''s 1951 on-screen portrayal of Stanley made him a cultural icon. Brando eclipsed the reputation of other great actors circa 1950, such as Paul Muni and Fredric March. Only the luster of Spencer Tracy''s reputation hasn''t dimmed when seen in the starlight thrown off by Brando. However, neither Tracy nor Olivier created an entire school of acting just by the force of his personality. Brando did.',
       TO_DATE('1924-04-03', 'YYYY-MM-DD'), TO_DATE('2004-07-01', 'YYYY-MM-DD'));
insert into actor (name, description, dob, dod)
values('Jack Black', 'Thomas Jacob "Jack" Black was born on August 28, 1969 in Santa Monica, California and raised in Hermosa Beach, California to Judith Love Cohen '|| '&' ||' Thomas William Black, both satellite engineers. He is of Russian Jewish '|| '&' || 'British-German ancestry. Black attended the University of California at Los Angeles. While at UCLA, he was a member of Tim Robbins'' acting troupe '|| '&' ||' it was through this collaboration that led to his 1992 film debut in Bob Roberts (1992). Although he was just a background voice in his first film, Jack''s appearances in such television shows as The X-Files (1993), his breakthrough performance in High Fidelity (2000)'|| '&' ||'his rock-comedy band, Tenacious D have created an ever-growing cult following.
- IMDb Mini Biography By: Anonymous', TO_DATE('1969-08-28', 'YYYY-MM-DD'), NULL);
insert into actor (name, description, dob, dod)
values('Michael J. Fox', 'Michael J. Fox was born Michael Andrew Fox on June 9, 1961 in Edmonton, Alberta, Canada, to Phyllis Fox (née Piper), a payroll clerk, and William Fox. His parents moved their 10-year-old son, his three sisters, Kelli Fox, Karen, and Jacki, and his brother Steven, to Vancouver, British Columbia, after his father, a sergeant in the Canadian Army Signal Corps, retired. During these years Michael developed his desire to act. At 15 he successfully auditioned for the role of a 10-year-old in a series called Leo and Me (1978). Gaining attention as a bright new star in Canadian television and movies, Michael realized his love for acting when he appeared on stage in "The Shadow Box." At 18 he moved to Los Angeles and was offered a few television-series roles, but soon they stopped coming and he was surviving on boxes of macaroni and cheese. Then his agent called to tell him that he got the part of Alex P. Keaton on the situation comedy Family Ties (1982). He starred in the feature films Teen Wolf (1985), High School U.S.A. (1983), Poison Ivy (1985) and Back to the Future (1985).
- IMDb Mini Biography By: A. Nonymous', TO_DATE('1961-06-09', 'YYYY-MM-DD'), NULL);
insert into actor (name, description, dob, dod)
values('Matthew McConaughey', 'American actor and producer Matthew David McConaughey was born in Uvalde, Texas. His mother, Mary Kathleen (McCabe), is a substitute school teacher originally from New Jersey. His father, James Donald McConaughey, was a Mississippi-born gas station owner who ran an oil pipe supply business. He is of Irish, Scottish, German, English, and Swedish descent. Matthew grew up in Longview, Texas, where he graduated from the local High School (1988). Showing little interest in his father''s oil business, which his two brothers later joined, Matthew was longing for a change of scenery, and spent a year in Australia, washing dishes and shoveling chicken manure. Back to the States, he attended the University of Texas in Austin, originally wishing to be a lawyer. But, when he discovered an inspirational Og Mandino book "The Greatest Salesman in the World" before one of his final exams, he suddenly knew he had to change his major from law to film.', TO_DATE('1969-11-04', 'YYYY-MM-DD'), NULL);

insert into writer (name, description, dob, dod)
values('Robert Zemeckis', 'A whiz-kid with special effects, Robert is from the Spielberg camp of film-making (Steven Spielberg produced many of his films). Usually working with writing partner Bob Gale, Robert''s earlier films show he has a talent for zany comedy (Romancing the Stone (1984), 1941 (1979)) and special effect vehicles (Who Framed Roger Rabbit (1988) and Back to the Future (1985)). His later films have become more serious, with the hugely successful Tom Hanks vehicle Forrest Gump (1994) and the Jodie Foster film Contact (1997), both critically acclaimed movies. Again, these films incorporate stunning effects. Robert has proved he can work a serious story around great effects.
- IMDb Mini Biography By: David Wilcock <david.wilcock@btinternet.com>', TO_DATE('1951-05-14', 'YYYY-MM-DD'), NULL);
insert into writer (name, description, dob, dod)
values('Chris Bowman', 'Chris Bowman is known for A Minecraft Movie (2025), Ninety-Five Senses (2022) and Middle School: The Worst Years of My Life (2016).', NULL, NULL);
insert into writer (name, description, dob, dod)
values('Mario Puzo', 'Mario Puzo was born October 15, 1920, in "Hell''s Kitchen" on Manhattan''s (NY) West Side and, following military service in World War II, attended New York''s New School for Social Research and Columbia University. His best-known novel, "The Godfather," was preceded by two critically acclaimed novels, "The Dark Arena" and "The Fortunate Pilgrim." In 1978, he published "Fools Die," followed by "The Sicilian" (1984) and "The Fourth K" (1991). Mario Puzo has also written several screenplays, including Earthquake (1974), Superman (1978), and all three "Godfather" movies, for which he received two Academy Awards. Mario''s latest novel, 1996''s "The Last Don," was made into a CBS television miniseries in May 1997, starring Danny Aiello, Kirstie Alley and Joe Mantegna. In 1997, Part II was aired. Also in 1997, Mario''s "The Fortunate Pilgrim" was re-released by Random House. Mario passed away July 2, 1999, at his home in Bay Shore, Long Island. His last novel, "Omerta," will be published July, 2000. He is survived by his companion of 20 years, Carol Gino, and five children.
- IMDb Mini Biography By: J Geoff Malta <jgeoff@jgeoff.com>', TO_DATE('1920-10-15', 'YYYY-MM-DD'), NULL);
insert into writer (name, description, dob, dod)
values('Stephen King', 'Stephen Edwin King was born on September 21, 1947, at the Maine General Hospital in Portland. His parents were Nellie Ruth (Pillsbury), who worked as a caregiver at a mental institute, and Donald Edwin King, a merchant seaman. His father was born under the surname "Pollock," but used the last name "King," under which Stephen was born. He has an older brother, David. The Kings were a typical family until one night, when Donald said he was stepping out for cigarettes and was never heard from again. Ruth took over raising the family with help from relatives. They traveled throughout many states over several years, finally moving back to Durham, Maine, in 1958.', TO_DATE('1947-09-21', 'YYYY-MM-DD'), NULL);
insert into writer (name, description, dob, dod)
values('Jonathan Nolan', 'Attended Loyola Academy in Wilmette, Illinois, graduating in 1994. Graduated from Georgetown University in Washington, D.C. in 1999. Majored in English. Shortly after graduating from Georgetown University, Jonathan Nolan served as a production assistant on Memento (2000). Wrote the short story, "Memento Mori", on which the film Memento (2000) is based.Was co-writer, with his brother Christopher Nolan, on The Prestige (2006), The Dark Knight (2008) and The Dark Knight Rises (2012). Also co-wrote the Terminator Salvation (2009).
- IMDb Mini Biography By: Peter A.', TO_DATE('1976-06-06', 'YYYY-MM-DD'), NULL);

insert into movie (id, movie_name, description, duration, rating)
values ('tt0111161', 'The Shawshank Redemption', 'A banker convicted of uxoricide forms a friendship over a quarter century with a hardened convict, 
while maintaining his innocence and trying to remain hopeful through simple compassion.', 182, 9.3);
insert into movie (id, movie_name, description, duration, rating)
values ('tt0068646', 'The Godfather','The aging patriarch of an organized crime dynasty transfers 
control of his clandestine empire to his reluctant son.', 415, 9.2);
insert into movie (id, movie_name, description, duration, rating)
values ('tt3566834', 'A Minecraft Movie', 'Four misfits are suddenly pulled through a mysterious portal into a bizarre cubic wonderland that thrives on imagination. To get back home theyll have to master this world while embarking on a quest with an unexpected expert crafter.',
101, 5.9);
insert into movie (id, movie_name, description, duration, rating)
values ('tt0088763', 'Back to the Future', 'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, 
the maverick scientist Doc Brown.', 96, 8.5);
insert into movie (id, movie_name, description, duration, rating)
values ('tt0816692', 'Interstellar', 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, 
is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', 169, 8.7);

insert into directs_movie (movie_id, director_name)
values('tt0111161', 'Frank Darabont');
insert into directs_movie (movie_id, director_name)
values('tt0068646', 'Francis Ford Coppola');
insert into directs_movie (movie_id, director_name)
values('tt3566834', 'Jared Hess');
insert into directs_movie (movie_id, director_name)
values('tt0088763', 'Robert Zemeckis');
insert into directs_movie (movie_id, director_name)
values('tt0816692', 'Christopher Nolan');

insert into acts_movie (movie_id, actor_name)
values('tt0111161', 'Tim Robbins');
insert into acts_movie (movie_id, actor_name)
values('tt0068646', 'Marlon Brando');
insert into acts_movie (movie_id, actor_name)
values('tt3566834', 'Jack Black');
insert into acts_movie (movie_id, actor_name)
values('tt0088763', 'Michael J. Fox');
insert into acts_movie (movie_id, actor_name)
values('tt0816692', 'Matthew McConaughey');

insert into writes_movie (movie_id, writer_name)
values('tt0111161', 'Stephen King');
insert into writes_movie (movie_id, writer_name)
values('tt0068646', 'Mario Puzo');
insert into writes_movie (movie_id, writer_name)
values('tt3566834', 'Chris Bowman');
insert into writes_movie (movie_id, writer_name)
values('tt0088763', 'Robert Zemeckis');
insert into writes_movie (movie_id, writer_name)
values('tt0816692', 'Jonathan Nolan');

insert into tv_show (id, description, tv_show_name)
values ('tt0903747', 'A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing 
and selling methamphetamine with a former student to secure his familys future.', 'Breaking Bad');
insert into tv_show (id, description, tv_show_name)
values ('tt2861424', 'The fractured domestic lives of a nihilistic mad scientist and his anxious grandson are 
further complicated by their inter-dimensional misadventures.', 'Rick and Morty');
insert into tv_show (id, description, tv_show_name)
values ('tt8420184', 'Led by Michael Jordan, the 1990s Chicago Bulls establish themselves as 
one of the most notable dynasties in sports history.', 'The Last Dance');
insert into tv_show (id, description, tv_show_name)
values ('tt0108778', 'Follows the personal and professional lives of six twenty to thirty year-old friends 
living in the Manhattan borough of New York City.', 'Friends');
insert into tv_show (id, description, tv_show_name)
values ('tt0121955', 'Follows the misadventures of four irreverent grade-schoolers in the quiet, dysfunctional town of South Park, Colorado.', 'South Park');

insert into director (name, description, dob, dod)
values('Vince Gilligan', 'George Vincent Gilligan Jr. (born February 10, 1967) is an American writer, producer, and director. He is known for his television work, specifically as creator, head writer, executive producer, and director of Breaking Bad and its spin-off Better Call Saul. He was a writer and producer for The X-Files and was the co-creator of its spin-off The Lone Gunmen.', TO_DATE('1967-02-10', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values('Dan Harmon', 'Dan Harmon was born on January 3, 1973 in Milwaukee, Wisconsin, USA. He is best known as the creator, writing, and producer for Community (2009) and Rick and Morty (2013). He also is known for writing and producing earlier works such as Computerman (2003), and Laser Fart (2004). He was previously married to Erin McGathy.
- IMDb Mini Biography By: Brave-traveler', TO_DATE('1973-01-03', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values('Jason Hehir', 'Jason Hehir was born on 29 September 1976 in Newton, Massachusetts, USA. He is a producer and director, known for The Last Dance (2020), UFC Primetime (2009) and 30 for 30 (2009).', TO_DATE('1976-09-29', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values('Michael Lembeck', 'Michael Lembeck was born in Brooklyn, New York, USA to Harvey Lembeck and Caroline Lembeck, both in show business. He graduated from Beverly Hills High School in 1966 and his classmates in a drama course included Rob Reiner, Albert Brooks and Richard Dreyfuss.After continuing his drama studies at Los Angeles City College and Cal State, he added singing and dancing lessons, and performed in summer stock productions. He toured with the original National company of the Broadway hit, "Grease", with John Travolta as his roommate.', TO_DATE('1948-06-25', 'YYYY-MM-DD'), NULL);
insert into director (name, description, dob, dod)
values('Eric Stough', 'Eric Stough is known for South Park (1997), Team America: World Police (2004) and South Park: Bigger, Longer '|| '&' ||' Uncut (1999).', NULL, NULL);

insert into writer (name, description, dob, dod)
values('Vince Gilligan', 'George Vincent Gilligan Jr. (born February 10, 1967) is an American writer, producer, and director. He is known for his television work, specifically as creator, head writer, executive producer, and director of Breaking Bad and its spin-off Better Call Saul. He was a writer and producer for The X-Files and was the co-creator of its spin-off The Lone Gunmen.', TO_DATE('1967-02-10', 'YYYY-MM-DD'), NULL);
insert into writer (name, description, dob, dod)
values('Dan Harmon', 'Dan Harmon was born on January 3, 1973 in Milwaukee, Wisconsin, USA. He is best known as the creator, writing, and producer for Community (2009) and Rick and Morty (2013). He also is known for writing and producing earlier works such as Computerman (2003), and Laser Fart (2004). He was previously married to Erin McGathy.
- IMDb Mini Biography By: Brave-traveler', TO_DATE('1973-01-03', 'YYYY-MM-DD'), NULL);
insert into writer (name, description, dob, dod)
values ('David Crane', 'David Crane was born on August 13, 1957 in Philadelphia, Pennsylvania, USA. He is a writer and producer, known for Friends (1994), Dream On (1990) and Episodes (2011).', TO_DATE('1957-08-13', 'YYYY-MM-DD'), NULL);
insert into writer (name, description, dob, dod)
values('Trey Parker', 'Trey was born in Conifer, Colorado, on October 19, 1969 to Randy Parker, a geologist, and Sharon Parker, an insurance broker. He has an older sister, Shelley Parker. He met Matt Stone (co-creator of South Park (1997)) while attending the University of Colorado in Boulder, where he had a double major of music and Japanese. While at UCB he wrote, directed and starred in Cannibal! The Musical (1993) (aka "Cannibal: The Musical!") based on a true episode in Colorado''s history. After graduation from UCB (rumors that he didn''t due to skipping classes to work on the movie are false), he and Stone were asked by then-FoxLab executive Brian Graden to create an animated Christmas card for his friends and family. The now infamous short, titled The Spirit of Christmas (1995), led to South Park (1997).
- IMDb Mini Biography By: Slick Matecheck sickslick27@yahoo.com', TO_DATE('1969-10-19', 'YYYY-MM-DD'), NULL);

insert into actor (name, description, dob, dod)
values('Bryan Cranston', 'Bryan Lee Cranston was born on March 7, 1956 in Hollywood, California, to Audrey Peggy Sell, a radio actress, and Joe Cranston, an actor and former amateur boxer. His maternal grandparents were German, and his father was of Irish, German, and Austrian-Jewish ancestry. He was raised in the Canoga Park neighborhood of Los Angeles, and also stayed with his grandparents, living on their poultry farm in Yucaipa. Cranston''s father walked out on the family when Cranston was eleven, and they did not see each other again until 11 years later, when Cranston and his brother decide to track down their father.', TO_DATE('1956-03-07', 'YYYY-MM-DD'), NULL);
insert into actor (name, description, dob, dod)
values('Chris Parnell', 'Born and raised in Memphis, Tennessee, Chris Parnell enrolled at Germantown High School where he took drama and auditioned for every play. In 1985, when he was a senior at Germantown, he was voted "Most Talented" by his classmates. Right after graduating high school, Chris attended North Carolina School of Arts in Winston-Salem, where he received his BFA in Drama. He later performed with the Berkshire Theatre in Stockbridge, Massachusetts, and the Alley Theatre in Houston, Texas. Afterwards Chris moved back to Tennessee and taught acting, film, and video at his own Germantown High School. He became bored, however, with teaching and moved to Los Angeles. Once in LA, he got a job at FAO Schwartz in Beverly Center, where he eventually became Operations Manager. During that time, Chris began taking classes at The Groundlings Main Company, where many Saturday Night Live (1975) cast members are discovered. Fate would have it that talent scouts from Saturday Night Live (1975) saw him and asked him to fly to New York for an audition. Completely surprised by his chances, he took the offer. To his amazement soon after he joined Saturday Night Live (1975) and became a featured player in the 1998-99 season. Parnell has since performed many impressions as NBC News'' Tom Brokaw, former House Speaker Newt Gingrich, Tom Hanks, Senator John McCain, and Eminem. Parnell has also appeared as a member of Saturday Night Live (1975)''s resident boy band "Seven Degrees Celsius," but his biggest claim to fame on the show was when he performed an unforgettable hardcore gansta rap fantasizing about a dream date with Britney Spears on Weekend Update. He spends most of his summers in L.A. where he owns his own car and apartment.
- IMDb Mini Biography By: Rod Reece', TO_DATE('1967-02-05', 'YYYY-MM-DD'), NULL);
insert into actor (name, description, dob, dod)
values('David Aldridge', 'David Aldridge is known for How Sports Feel to People Who Don''t Like Sports (2017), NBA 2K19 (2018) and The Last Dance (2020).', NULL, NULL);
insert into actor (name, description, dob, dod)
values('Jennifer Aniston', 'Jennifer Aniston was born in Sherman Oaks, California, to actors John Aniston and Nancy Dow. Her father was Greek, and her mother was of English, Irish, Scottish, and Italian descent. Jennifer spent a year of her childhood living in Greece with her family. Her family then relocated to New York City where her parents divorced when she was nine. Jennifer was raised by her mother and her father landed a role, as "Victor Kiriakis", on the daytime soap Days of Our Lives (1965). Jennifer had her first taste of acting at age 11 when she joined the Rudolf Steiner School''s drama club. It was also at the Rudolf Steiner School that she developed her passion for art. She began her professional training as a drama student at New York''s School of Performing Arts, aka the "Fame" school. It was a division of Fiorello H. LaGuardia High School of Music and the Arts. In 1987, after graduation, she appeared in such Off-Broadway productions as "For Dear Life" and "Dancing on Checker''s Grave". In 1990, she landed her first television role, as a series regular on Molloy (1990). She also appeared in The Edge (1992), Ferris Bueller (1990), and had a recurring part on Herman''s Head (1991). By 1993, she was floundering. Then, in 1994, a pilot called "Friends Like These" came along. Originally asked to audition for the role of "Monica", Aniston refused and auditioned for the role of "Rachel Green", the suburban princess turned coffee peddler. With the success of the series Friends (1994), Jennifer has become famous and sought-after as she turns her fame into movie roles during the series hiatus.
- IMDb Mini Biography By: cb@lim.nl', TO_DATE('1969-02-11', 'YYYY-MM-DD'), NULL);
insert into actor (name, description, dob, dod)
values('Jonny Greenwood', 'Jonny Greenwood was born on November 5, 1971 in Oxford, Oxfordshire, England, UK. He is a composer and actor, known for The Master (2012), There Will Be Blood (2007) and Phantom Thread (2017). He has been married to Sharona Katan since 1995. They have three children.', TO_DATE('1971-11-05', 'YYYY-MM-DD'), NULL);

insert into directs_tv_show (tv_show_id, director_name)
values('tt0903747', 'Vince Gilligan');
insert into directs_tv_show (tv_show_id, director_name)
values('tt2861424', 'Dan Harmon');
insert into directs_tv_show (tv_show_id, director_name)
values('tt8420184', 'Jason Hehir');
insert into directs_tv_show (tv_show_id, director_name)
values('tt0108778', 'Michael Lembeck');
insert into directs_tv_show (tv_show_id, director_name)
values('tt0121955', 'Eric Stough');

insert into writes_tv_show (tv_show_id, writer_name)
values ('tt0903747', 'Vince Gilligan');
insert into writes_tv_show (tv_show_id, writer_name)
values ('tt2861424', 'Dan Harmon');
insert into writes_tv_show (tv_show_id, writer_name)
values ('tt0108778', 'David Crane');
insert into writes_tv_show (tv_show_id, writer_name)
values ('tt0121955', 'Trey Parker');

insert into acts_tv_show (tv_show_id, actor_name)
values('tt0903747', 'Bryan Cranston');
insert into acts_tv_show (tv_show_id, actor_name)
values('tt2861424', 'Chris Parnell');
insert into acts_tv_show (tv_show_id, actor_name)
values('tt8420184', 'David Aldridge');
insert into acts_tv_show (tv_show_id, actor_name)
values('tt0108778', 'Jennifer Aniston');
insert into acts_tv_show (tv_show_id, actor_name)
values('tt0121955', 'Jonny Greenwood');

insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0903747', 1, 1, 'Pilot', '00:58', 'After being diagnosed with terminal lung cancer, a struggling high school chemistry teacher makes a drastic choice to secure his family''s future--turning to the drug trade with a former student.'
, TO_DATE('2008-01-20', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0903747', 1, 2, 'Cat''s in the Bag...', '00:48', 'Walter and Jesse scramble to deal with the consequences of their first cook, leading to a tense and unexpected dilemma. Meanwhile, Skyler grows suspicious of Walter''s strange behavior.'
, TO_DATE('2008-01-27', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0903747', 1, 3, '...And the Bag''s in the River', '00:48', 'Walter is forced to make a life-altering decision as he and Jesse deal with the fallout of their actions. Meanwhile, Skyler''s suspicions continue to grow, and Hank begins to take notice of Walter''s unusual behavior.'
, TO_DATE('2008-02-10', 'YYYY-MM-DD'));

insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt2861424', 1, 1, 'Pilot', '00:22', 'A strangely eccentric genius scientist and inventor moves into the home of his daughter and her family and begins to strongly influence his young grandson.'
, TO_DATE('2013-12-02', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt2861424', 1, 2, 'Lawnmower Dog', '00:22', 'Rick helps Jerry out with the dog.'
, TO_DATE('2013-12-09', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt2861424', 1, 3, 'Anatomy Park', '00:22', 'It''s Christmas. Rick shrinks Morty, injecting him into a homeless man to save Anatomy Park. Jerry tries to have a Christmas free of electronic devices, but regrets his decision when his parents introduce him to their new friend.'
, TO_DATE('2013-12-16', 'YYYY-MM-DD'));

insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt8420184', 1, 1, 'Episode I', '00:50', 'Flashbacks chronicle Michael Jordan''s college and early NBA days. The Bulls make a preseason trip to Paris amid tensions with GM Jerry Krause.'
, TO_DATE('2020-04-19', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt8420184', 1, 2, 'Episode II', '00:50', '
Scottie Pippen rises from obscurity to become one of the NBA''s best players. An injury early in Michael''s career sows distrust with Bulls management.'
, TO_DATE('2020-04-19', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt8420184', 1, 3, 'Episode III', '00:48', 'Dennis Rodman''s attitude and energy help the team win, but bring the drama off the court. The Bulls struggle to overcome the Pistons in the late ''80s.'
, TO_DATE('2020-04-26', 'YYYY-MM-DD'));

insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0108778', 1, 1, 'The One Where Monica Gets a Roommate', '00:22', 'Monica and the gang introduce Rachel to the "real world" after she leaves her fiancé at the altar.'
, TO_DATE('1994-09-22', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0108778', 1, 2, 'The One with the Sonogram at the End', '00:22', 'Ross finds out his ex-wife is pregnant. Rachel returns her engagement ring to Barry. Monica becomes stressed when her and Ross''s parents come to visit.'
, TO_DATE('1994-09-29', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0108778', 1, 3, 'The One with the Thumb', '00:22', 'Monica becomes irritated when everyone likes her new boyfriend more than she does. Chandler resumes his smoking habit. Phoebe is given $7000 when she finds a thumb in a can of soda.'
, TO_DATE('1994-10-06', 'YYYY-MM-DD'));

insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0121955', 1, 0, 'Unaired Pilot', '00:28', 'Cartman wakes up and realizes he was abducted by aliens after hearing it from his friends. He is in major denial at first though, but even Chef is a believer.'
, TO_DATE('1997-08-13', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0121955', 1, 1, 'Cartman Gets an Anal Probe', '00:22', 'Cartman''s dream about being abducted by aliens turns out to have actually happened, and when the aliens take Kyle''s brother, all of them must find a way to bring the aliens back and confront them.'
, TO_DATE('1997-08-13', 'YYYY-MM-DD'));
insert into episode (tv_show_id, season_number, episode_number, name, length, description, initial_air_date)
values('tt0121955', 1, 2, 'Weight Gain 4000', '00:22', 'Kathie Lee Gifford comes to South Park to present an award to Cartman, and Mr. Garrison hopes to use the event to assassinate her.'
, TO_DATE('1997-08-27', 'YYYY-MM-DD'));

insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Drug Crime');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Epic');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Psychological Drama');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Psychological Thriller');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Tragedy');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Crime');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Drama');
insert into tv_show_genre (tv_show_id, genre)
values('tt0903747', 'Thriller');

insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Adult Animation');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Farce');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Parody');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Satire');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Sitcom');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Time Travel');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Adventure');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Animation');
insert into tv_show_genre (tv_show_id, genre)
values('tt2861424', 'Comedy');

insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'Basketball');
insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'Docuseries');
insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'Sports Documentary');
insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'Biography');
insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'Documentary');
insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'History');
insert into tv_show_genre (tv_show_id, genre)
values('tt8420184', 'Sport');

insert into tv_show_genre (tv_show_id, genre)
values('tt0108778', 'Feel-Good Romance');
insert into tv_show_genre (tv_show_id, genre)
values('tt0108778', 'Parody');
insert into tv_show_genre (tv_show_id, genre)
values('tt0108778', 'Romantic Comedy');
insert into tv_show_genre (tv_show_id, genre)
values('tt0108778', 'Sitcom');
insert into tv_show_genre (tv_show_id, genre)
values('tt0108778', 'Comedy');
insert into tv_show_genre (tv_show_id, genre)
values('tt0108778', 'Romance');

insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Adult Animation');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Computer Animation');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Dark Comedy');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Farce');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Parody');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Raunchy Comedy');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Satire');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Sitcom');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Animation');
insert into tv_show_genre (tv_show_id, genre)
values('tt0121955', 'Comedy');

insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0903747', 'NETFLIX');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0903747', 'Prime Video');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0903747', 'Amazon');

insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'Adult Swim');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'Cartoon Network');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'hulu');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'HBO Max');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'Toku');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'Prime Video');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt2861424', 'Amazon');

insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt8420184', 'NETFLIX');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt8420184', 'ESPN+');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt8420184', 'Prime Video');

insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'Bravo Now');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'E! Now');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'hulu');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'HBO Max');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'NBC');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'NETFLIX');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'Peacock');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'Pluto TV');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'Syfy Now');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'TBS');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'Telemundo Now');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values('tt0108778', 'Tubi');

insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'Amazon Kids+');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'BritBox');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'ESPN+');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'HBO Max');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'NickHits');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'Paramount+');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'Peacock');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'Pluto TV');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'Prime Video');
insert into tv_show_streaming_service (tv_show_id, streaming_service)
values ('tt0121955', 'Tubi');

insert into movie_genre (movie_id, genre)
values ('tt0111161', 'Epic');
insert into movie_genre (movie_id, genre)
values ('tt0111161', 'Period Drama');
insert into movie_genre (movie_id, genre)
values ('tt0111161', 'Prison Drama');
insert into movie_genre (movie_id, genre)
values ('tt0111161', 'Drama');

insert into movie_genre (movie_id, genre)
values ('tt0068646', 'Epic');
insert into movie_genre (movie_id, genre)
values ('tt0068646', 'Gangster');
insert into movie_genre (movie_id, genre)
values ('tt0068646', 'Tragedy');
insert into movie_genre (movie_id, genre)
values ('tt0068646', 'Crime');
insert into movie_genre (movie_id, genre)
values ('tt0068646', 'Drama');

insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Action Epic');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Adventure Epic');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Fantasy Epic');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'High-Concept Comedy');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Quest');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Slapstick');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Survival');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Action');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Adventure');
insert into movie_genre (movie_id, genre)
values ('tt3566834', 'Comedy');

insert into movie_genre (movie_id, genre)
values ('tt0088763', 'High-Concept Comedy');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Teen Adventure');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Teen Comedy');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Time Travel');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Urban Adventure');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Adventure');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Comedy');
insert into movie_genre (movie_id, genre)
values ('tt0088763', 'Sci-Fi');

insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Adventure Epic');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Epic');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Quest');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Sci-Fi Epic');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Space Sci-Fi');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Time Travel');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Adventure');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Drama');
insert into movie_genre (movie_id, genre)
values ('tt0816692', 'Sci-Fi');

insert into movie_streaming_service (movie_id, streaming_service)
values('tt0111161', 'Prime Video');
insert into movie_streaming_service (movie_id, streaming_service)
values('tt0111161', 'Amazon');

insert into movie_streaming_service (movie_id, streaming_service)
values('tt0068646', 'Pluto');

insert into movie_streaming_service (movie_id, streaming_service)
values('tt0088763', 'Prime Video');
insert into movie_streaming_service (movie_id, streaming_service)
values('tt0088763', 'Amazon');

insert into movie_streaming_service (movie_id, streaming_service)
values('tt0816692', 'hulu');
insert into movie_streaming_service (movie_id, streaming_service)
values('tt0816692', 'Paramount+');
insert into movie_streaming_service (movie_id, streaming_service)
values('tt0816692', 'Peacock');
