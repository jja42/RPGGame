EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
The soldier tenses up a bit, he's clearly attempting to seem professional despite being quite nervous. "W-What do you need?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[Are you alright?]
->ally
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The man is a bit shaken by your questions, taking a moment to regain his confidence.
{
-check_mood(4) == 3:
"I'm an elite soldier! Top guard of this village!" 
{
-check_rep("apathy") == 1:
+[I don't buy it]
->confidence
}
- else:
"I'm a soldier of course, n-no questioning that!"
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man shivers a bit before straightening himself up.
{
-check_mood(4) == 3:
"I protect this village with all my heart! It is my life's duty!"
{
-check_rep("apathy") == 1:
+[You're far too tense]
->tense
}
- else:
"I'm work as a guard for this village, keeping an eye on things. "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The man puffs out his chest a bit, quivering as he does so.
{
-check_mood(4) == 2:
"No ... not really. I'm quite nervous about all of this. Just last week I was conscripted and then they put me on guard duty right away."
{
-check_rep("empathy") == 1:
+[That sounds quite rough]
->rough
}
- else:
"Y-Yes, I'm doing just fine, thank you!"
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(4) == 1:
"I ... I really don't like to talk about the war. It's so violent and scary."
{
-check_rep("aggression") == 1:
+[And you call yourself a soldier?!]
->anger
}
- else:
"I really don't have too much of an opinion on it."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(4) == 2:
"This is just the place I was brought up in, I know a bit about it but nothing super useful."
{
-check_rep("pragmatism") == 1:
+[Know any good deals?]
->deals
}
- else:
"This is the village of the honorable pious wind people."
}
+[Leave him be]
->END
+[Back]
->choices
==confidence==
The man lets out a muffled yelp as if he's been found out. He shakes a bit before reasserting "I assure you I'm an elite soldier."
~rep  = "apath_true"
->END
==tense==
The soldier breathes in and out slowly for a bit, trying to relieve his tension. It works shortly but when he turns back he tenses up once more "I'm merely remaining awake and aware."
~rep = "apath_true"
->END
==rough==
The soldier sighs and nods "This has all been a huge turn in my life and I'm not sure how to handle it. Thanks for being understanding."
~rep = "emp_true"
->END
==anger==
Your outburst frightens the man, causing him to cower for a bit. He looks back towards you and just mumbles apologetically "Sorry"
~rep = "agg_true"
->END
==deals==
He thinks it over for a second before responding. "The priestess and monks are usually quite generous.
~rep = "prag_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1