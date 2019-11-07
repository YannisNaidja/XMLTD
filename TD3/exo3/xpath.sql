-- TD3 - exo3
-- Les noms des auteurs des tweets.
-- /tweeter/users/user[@id = /tweeter/tweets/tweet/@author_ref]/concat(first_name, ' ', last_name)
PROMPT Les noms des auteurs des tweets.
PROMPT /tweeter/users/user[@id = /tweeter/tweets/tweet/@author_ref]/concat(first_name, ' ', last_name)

SELECT EXTRACT(xml_content,'/tweeter/users/user[@id=/tweeter/tweets/tweet/@author_ref]/user_name') AS nom FROM tweet_CLOB;

-- Les tweets de l’utilisateur dont l’id est "u41".
-- /tweeter/tweets/tweet[@author_ref='U41']
PROMPT Les tweets de l’utilisateur dont l’id est "u41".
PROMPT /tweeter/tweets/tweet[@author_ref='U41']

SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet[@author_ref=''U41'']') AS tweet FROM tweet_CLOB;

-- Les tweets contenants l’hashtag “\#I3XML"
-- /tweeter/tweets/tweet/body/hashtag[contains(text(), '#I3XML')]/ancestor::tweet	
PROMPT Les tweets contenants l’hashtag “\#I3XML"
PROMPT /tweeter/tweets/tweet/body/hashtag[contains(text(), '#I3XML')]/ancestor::tweet	

SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet/body/hashtag[contains(text(), ''#I3XML'')]') FROM tweet_CLOB;

-- Les retweets du tweet dont l’id est "t42".
-- /tweeter/tweets/tweet[@id = /tweeter/tweets/tweet[@id = "T42"]/header/retweets/retweet/@ref]
PROMPT Les retweets du tweet dont l’id est "t42".
PROMPT /tweeter/tweets/tweet[@id = /tweeter/tweets/tweet[@id = "T42"]/header/retweets/retweet/@ref]

SELECT EXTRACT(xml_content, '/tweeter/tweets/tweet[@id = /tweeter/tweets/tweet[@id = "T42"]/header/retweets/retweet/@ref]') AS tweet FROM tweet_CLOB;

-- Les tweet sans hashtags.
-- /tweeter/tweets/tweet/body[count(hashtag) = 0]/parent::tweet
SELECT EXTRACT(xml_content,'/tweeter/tweets/tweet/body[count(hashtag) = 0]/parent::tweet') FROM tweet_CLOB;
