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
name VARCHAR2 (15) CONSTRAINT director_name_pk PRIMARY KEY,
description VARCHAR2 (5000),
dob DATE,
dod DATE
);

CREATE TABLE writer (
name VARCHAR2 (15) CONSTRAINT writer_name_pk PRIMARY KEY,
description VARCHAR2 (5000),
dob DATE,
dod DATE
);

CREATE TABLE actor (
name VARCHAR2 (15) CONSTRAINT actor_name_pk PRIMARY KEY,
description VARCHAR2 (5000),
dob DATE,
dod DATE
);

CREATE TABLE directs_tv_show (
tv_show_id NUMBER (10),
director_name VARCHAR2 (15),
CONSTRAINT directs_tv_id_dir_name_pk PRIMARY KEY (tv_show_id, director_name)
);

CREATE TABLE acts_tv_show (
tv_show_id NUMBER (10),
actor_name VARCHAR2 (15),
CONSTRAINT acts_tv_id_act_name_pk PRIMARY KEY (tv_show_id, actor_name)
);

CREATE TABLE writes_tv_show (
tv_show_id NUMBER (10),
writer_name VARCHAR2 (15),
CONSTRAINT writes_tv_id_wr_name_pk PRIMARY KEY (tv_show_id, writer_name)
);

CREATE TABLE directs_movie (
movie_id NUMBER (10),
director_name VARCHAR2 (15),
CONSTRAINT directs_id_dir_name_pk PRIMARY KEY (movie_id, director_name)
);

CREATE TABLE acts_movie (
movie_id NUMBER (10),
actor_name VARCHAR2 (15),
CONSTRAINT acts_id_act_name_pk PRIMARY KEY (movie_id, actor_name)
);

CREATE TABLE writes_movie (
movie_id NUMBER (10),
writer_name VARCHAR2 (15),
CONSTRAINT writes_id_wri_name_pk PRIMARY KEY (movie_id, writer_name)
);

CREATE TABLE episode (
tv_show_id NUMBER (10),
season_number NUMBER (2),
episode_number NUMBER (2),
name VARCHAR2 (20),
length NUMBER (4),
description VARCHAR2 (50),
initial_air_date DATE,
CONSTRAINT episode_id_sn_en_pk PRIMARY KEY (tv_show_id, season_number, episode_number)
);

CREATE TABLE tv_show (
id NUMBER (10) CONSTRAINT tv_show_id_pk PRIMARY KEY,
description VARCHAR2 (5000),
tv_show_name VARCHAR2 (20)
);

CREATE TABLE tv_show_streaming_service (
tv_show_id NUMBER (10),
streaming_service VARCHAR (15),
CONSTRAINT tv_id_ss_pk PRIMARY KEY (tv_show_id, streaming_service)
);

CREATE TABLE tv_show_genre (
tv_show_id NUMBER (10),
genre VARCHAR (15),
CONSTRAINT tv_id_genre_pk PRIMARY KEY (tv_show_id, genre)
);

CREATE TABLE movie (
id NUMBER (10) CONSTRAINT movie_id_pk PRIMARY KEY,
movie_name VARCHAR2 (20),
description VARCHAR2 (5000),
duration NUMBER(4),
rating NUMBER(2,1)
);

CREATE TABLE movie_streaming_service (
movie_id NUMBER (10),
streaming_service VARCHAR (15),
CONSTRAINT movie_id_ss_pk PRIMARY KEY (movie_id, streaming_service)
);

CREATE TABLE movie_genre (
movie_id NUMBER (10),
genre VARCHAR (15),
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
REFERENCES movie(id);

ALTER TABLE tv_show_streaming_service
ADD CONSTRAINT tv_show_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

ALTER TABLE episode
ADD CONSTRAINT episode_id_fk FOREIGN KEY (tv_show_id)
REFERENCES tv_show(id);

insert into director (name, description, dob, dod)
values ('Frank Darabont', 'Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production assistant on the 1981 low-budget film, Hell Night (1981), starring Linda Blair. He spent the next six years working in the art department as a set dresser and in set construction while struggling to establish himself as a writer. His first produced writing credit (shared) was on the 1987 film, A Nightmare on Elm Street 3: Dream Warriors (1987), directed by Chuck Russell. Darabont is one of only six filmmakers in history with the unique distinction of having his first two feature films receive nominations for the Best Picture Academy Award: 1994s The Shawshank Redemption (1994) (with a total of seven nominations) and 1999s The Green Mile (1999) (four nominations). Darabont himself collected Oscar nominations for Best Adapted Screenplay for each film (both based on works by Stephen King), as well as nominations for both films fro
m the Directors Guild of America, and a nomination from the Writers Guild of America for The Shawshank Redemption (1994).', '1959-01-28', NULL);
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
such films as The Escape Artist (1982), Hammett (1982) The Black Stallion Returns (1983), Barfly (1987), Wind (1992), The Secret Garden (1993), etc.', '1939-04-07', NULL);
insert into director (name, description, dob, dod)
values ('Jared Hess','Jared Lawrence Hess and Jerusha Elizabeth Hess (née Demke; born May 12, 1980) are husband-and-wife American filmmakers best known for their work on Napoleon Dynamite (2004), Nacho Libre (2006) and Gentlemen Broncos (2009), all of which they co-wrote and which were directed by Jared (Nacho Libre was co-written with Mike White). They 
also produced music videos for The Postal Services third single, "We Will Become Silhouettes", and 
The Killers Christmas charity single "Boots".', '1979-07-18', NULL);
insert into director (name, description, dob, dod)
values ('Robert Zemeckis', 'A whiz-kid with special effects, Robert is from the Spielberg camp of film-making 
(Steven Spielberg produced many of his films). Usually working with writing partner Bob Gale, Roberts earlier 
films show he has a talent for zany comedy (Romancing the Stone (1984), 1941 (1979)) and special effect vehicles 
(Who Framed Roger Rabbit (1988) and Back to the Future (1985)). His later films have become more serious, with 
the hugely successful Tom Hanks vehicle Forrest Gump (1994) and the Jodie Foster film Contact (1997), both 
critically acclaimed movies. Again, these films incorporate stunning effects. Robert has proved 
he can work a serious story around great effects.', '1951-05-14', NULL);
insert into director (name, description, dob, dod)
values ('Christopher Nolan', 'Best known for his cerebral, often nonlinear, storytelling, acclaimed Academy Award winner writer/director/producer Sir Christopher Nolan CBE was born in London, England. Over the course of more than 25 years of filmmaking, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made and became one of the most celebrated filmmakers of modern cinema.
At 7 years old, Nolan began making short films with his father s Super-8 camera. While studying English Literature at University College London, he shot 16-millimeter films at U.C.L. s film society, where he learned the guerrilla techniques he would later use to make his first feature, Following (1998), on a budget of around $6,000. The noir thriller was recognized at a number of international film festivals prior to its theatrical release and gained Nolan enough credibility that he was able to gather substantial financing for his next film.
Nolan s second film was Memento (2000), which he directed from his own screenplay based on a short story by his brother Jonathan Nolan. Starring Guy Pearce, the film brought Nolan numerous honors, including Academy Award and Golden Globe Award nominations for Best Original Screenplay. Nolan went on to direct the critically acclaimed psychological thriller, Insomnia (2002), starring Al Pacino, Robin Williams and Hilary Swank.
The turning point in Nolan s career occurred when he was awarded the chance to revive the Batman franchise in 2005. In Batman Begins (2005), Nolan brought a level of gravitas back to the iconic hero, and his gritty, modern interpretation was greeted with praise from fans and critics alike. Before moving on to a Batman sequel, Nolan directed, co-wrote, and produced the mystery thriller The Prestige (2006), starring Christian Bale and Hugh Jackman as magicians whose obsessive rivalry leads to tragedy and murder.
', '1970-07-30', NULL);

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






