
-- Creation tables

CREATE TABLE tweet_CLOB
(text_content varchar(20),xml_content XMLTYPE)XMLTYPE xml_content STORE AS CLOB;

CREATE TABLE tweet_BINARY
( text_content varchar(20),xml_content XMLTYPE)XMLTYPE xml_content STORE AS BINARY XML;

-- Insertion XML

INSERT INTO tweet_CLOB(text_content,xml_content)VALUES('tweet.xml', sys.xmltype.createxml('
<tweeter>
  <users>
    <user id="U41">
      <user_name>
	basil_dalie
      </user_name>
      <first_name>
	Basil
      </first_name>
      <last_name>
	Dalie
      </last_name>
      <profile>
	https://twitter.com/basil_dalie
      </profile>
    </user>
    <user id="U02">
      <user_name>
	Cicero
      </user_name>
      <first_name>
	Ci
      </first_name>
      <last_name>
	Cero
      </last_name>
      <profile>
	https://twitter.com/Cicero
      </profile>      
    </user>
    <user id="U43">
      <user_name>
	alex_not
      </user_name>
      <first_name>
	Alex
      </first_name>
      <last_name>
	Not
      </last_name>
      <profile>
	https://twitter.com/alex_n
      </profile>
    </user>
  </users>
  <tweets>
    <tweet id="T42" author_ref="U41">
      <header>
	<date>
	  1758312000
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	  <retweet ref="T04" />
	  <retweet ref="T05" />
	  <retweet ref="T03" />
	</retweets>
	<answers>
	  <answer ref="T02" />
	</answers>
	<operating_system>
	  Linux x86_64
	</operating_system>
	<images>
	  <image id="I01">
	    https://images2.minutemediacdn.com/image/upload/c_crop,h_1193,w_2121,x_0,y_64/f_auto,q_auto,w_1100/v1565279671/shape/mentalfloss/578211-gettyimages-542930526.jpg
	  </image>
	  <image id ="I02">
	    https://website.com/image.jpg
	  </image>
	</images>
	<videos>
	  <video id="V01">
	    https://website.com/video.avi
	  </video>
	</videos>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
	<text>
	  anim id est laborum
	</text>
	<image_ref ref="I01" />
	<user_ref ref="U02">
	  @Cicero
	</user_ref>
	<text>
	  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
	</text>
	<video_ref ref="V01" />
      </body>
    </tweet>
    <tweet id="T02" author_ref="U02" >
      <header>
	<date>
	  1758311999
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<answers>
	  <answer ref="T42" />
	  <answer ref="T43" />
	  <answer ref="T44" />
	</answers>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<hashtag>
	  #mollit
	</hashtag>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
	<hashtag>
	  #I&lt;3XML
	</hashtag>
	<text>
	  anim id est laborum
	</text>
	<video_ref ref="I01" />
      </body>
    </tweet>
    <tweet id="T03" author_ref="U41" >
      <header>
	<date>
	  1758312001
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
	<hashtag>
	  nofilter
	</hashtag>
	<hashtag>
	  xml
	</hashtag>
      </body>
    </tweet>   
    <tweet id="T43" author_ref="U02" >
      <header>
	<date>
	  1758312002
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
      </body>
    </tweet>   
    <tweet id="T44" author_ref="U02" >
      <header>
	<date>
	  1758312003
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
      </body>
    </tweet>   
  </tweets>
</tweeter>'));



INSERT INTO tweet_BINARY(text_content,xml_content)VALUES('tweet.xml', sys.xmltype.createxml('
<tweeter>
  <users>
    <user id="U41">
      <user_name>
	basil_dalie
      </user_name>
      <first_name>
	Basil
      </first_name>
      <last_name>
	Dalie
      </last_name>
      <profile>
	https://twitter.com/basil_dalie
      </profile>
    </user>
    <user id="U02">
      <user_name>
	Cicero
      </user_name>
      <first_name>
	Ci
      </first_name>
      <last_name>
	Cero
      </last_name>
      <profile>
	https://twitter.com/Cicero
      </profile>      
    </user>
    <user id="U43">
      <user_name>
	alex_not
      </user_name>
      <first_name>
	Alex
      </first_name>
      <last_name>
	Not
      </last_name>
      <profile>
	https://twitter.com/alex_n
      </profile>
    </user>
  </users>
  <tweets>
    <tweet id="T42" author_ref="U41">
      <header>
	<date>
	  1758312000
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	  <retweet ref="T04" />
	  <retweet ref="T05" />
	  <retweet ref="T03" />
	</retweets>
	<answers>
	  <answer ref="T02" />
	</answers>
	<operating_system>
	  Linux x86_64
	</operating_system>
	<images>
	  <image id="I01">
	    https://images2.minutemediacdn.com/image/upload/c_crop,h_1193,w_2121,x_0,y_64/f_auto,q_auto,w_1100/v1565279671/shape/mentalfloss/578211-gettyimages-542930526.jpg
	  </image>
	  <image id ="I02">
	    https://website.com/image.jpg
	  </image>
	</images>
	<videos>
	  <video id="V01">
	    https://website.com/video.avi
	  </video>
	</videos>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
	<text>
	  anim id est laborum
	</text>
	<image_ref ref="I01" />
	<user_ref ref="U02">
	  @Cicero
	</user_ref>
	<text>
	  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
	</text>
	<video_ref ref="V01" />
      </body>
    </tweet>
    <tweet id="T02" author_ref="U02" >
      <header>
	<date>
	  1758311999
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<answers>
	  <answer ref="T42" />
	  <answer ref="T43" />
	  <answer ref="T44" />
	</answers>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<hashtag>
	  #mollit
	</hashtag>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
	<hashtag>
	  #I&lt;3XML
	</hashtag>
	<text>
	  anim id est laborum
	</text>
	<video_ref ref="I01" />
      </body>
    </tweet>
    <tweet id="T03" author_ref="U41" >
      <header>
	<date>
	  1758312001
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
	<hashtag>
	  nofilter
	</hashtag>
	<hashtag>
	  xml
	</hashtag>
      </body>
    </tweet>   
    <tweet id="T43" author_ref="U02" >
      <header>
	<date>
	  1758312002
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
      </body>
    </tweet>   
    <tweet id="T44" author_ref="U02" >
      <header>
	<date>
	  1758312003
	</date>
	<timezone>
	  <standard>
	    UTC
	  </standard>
	  <offset>
	    1
	  </offset>
	</timezone>
	<location>
	  <latitude>
	    3.876716
	  </latitude>
	  <longitude>
	    43.610769
	  </longitude>
	  <city>
	    Montpellier
	  </city>
	  <country>
	    France
	  </country>
	</location>
	<language>
	  Latin
	</language>
	<retweets>
	</retweets>
	<operating_system>
	  Linux x86_64
	</operating_system>
      </header>
      <body>
	<text>
	  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
	</text>
      </body>
    </tweet>   
  </tweets>
</tweeter>'));

-- Requêtes Xpath

SELECT EXTRACT(xml_content,'/tweeter/users/user[@id=/tweeter/tweets/tweet/@author_ref]/concat(first_name, ' ', last_name)') FROM tweet_CLOB;
SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet[@author_ref='U41']') FROM tweet_CLOB;
SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet/body/hashtag[contains(text(), 'I<3XML')]/ancestor::tweet') FROM tweet_CLOB;
SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet/header/date[text() = max(/tweeter/tweets/tweet/header/date)]/parent::header/parent::tweet') FROM tweet_CLOB;
SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet/body[count(hashtag) = 0]/parent::tweet') FROM tweet_CLOB;


--Requêtes Xquery 

SELECT XMLQUERY('for $auteur in /tweeter/users/user 
  for  $tweet in /tweeter/tweets/tweet
  where $auteur/@id = $tweet/@author_ref  
  return
  <result>
  { $tweet }
  { $auteur }
  </result>' PASSING xml_content RETURNING CONTENT)FROM tweet_BINARY;


SELECT XMLQUERY('for $user in tweeter/users/user
  order by upper-case($user/user_name/text()) ascending
  return  $user' PASSING xml_content RETURNING CONTENT)FROM tweet_BINARY;


SELECT XMLQUERY('for $auteur in /tweeter/users/user
  return
  <result>
    <nom>
      { $auteur/user_name/text()}
    </nom> 
    {
      for $tweet in /tweeter/tweets/tweet
      where $auteur/@id = $tweet/@author_ref  
      return $tweet/header/date
    }
  </result>' PASSING xml_content RETURNING CONTENT)FROM tweet_BINARY;

SELECT XMLQUERY('for $auteur in /tweeter/users/user
    for $tweet in /tweeter/tweets/tweet
    where $auteur/@id = $tweet/@author_ref and count($tweet/header/retweets/retweet) > 1
    return $auteur' PASSING xml_content RETURNING CONTENT)FROM tweet_BINARY;

SELECT XMLQUERY('for $tweet in /tweeter/tweets/tweet
  return
  <tweet>
    <contenu>
      { $tweet/body/text}
    </contenu>
    <premieres-reponses>
      { /tweeter/tweets/tweet[@id=$tweet/header/answers/answer[1]/@ref]/header/date }
      { /tweeter/tweets/tweet[@id=$tweet/header/answers/answer[2]/@ref]/header/date }
    </premieres-reponses>
    {
      if (count($tweet/header/retweets/retweet) = 0) then
	<nonRetwitted />
      else()
    }
  </tweet>' PASSING xml_content RETURNING CONTENT)FROM tweet_BINARY;

















