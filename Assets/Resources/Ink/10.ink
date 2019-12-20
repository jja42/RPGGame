EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
A young girl runs by you, giggling as she goes about playing. She spends a few more moments going about before looking your way.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What are you doing?]
->converse
+[Can I join you?]
->ally
+[Where are your parents?]
->war
+[You shouldn't run like that]
->place
+[Leave him be]
->END
=== identity ===
The girl doesn't really stop running about as you speak, only barely hearing what you've asked.
{
-check_mood(0) == 1:
"I'm the prettiest girl in the whole wide world. Don't you think so?"
{
-check_rep("apathy") == 1:
+[Not at all]
->sad
}
- else:
"Hmm? I'm just me, who are you?"
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The girl lets out a long "Wheeeee" as she runs about.
{
-check_mood(0) == 2:
"I'm building up lots of speed so I can go really really fast" She says before slipping and losing all of her momentum. "Dang it"
{
-check_rep("pragmatism") == 1:
+[Let's have a race]
->race
}
- else:
"I'm playing lots and lots and having fun! "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The girl hesitates for a moment, looking you up and down. "Uhm"
{
-check_mood(0) == 2:
"I guess it should be ok. Let's play catch now." She says, tossing you a rock. You two toss the rock back and forth for a while.
{
-check_rep("empathy") == 1:
+[Play Nicely]
->play
}
- else:
"Well I don't know you and I'm not supposed to play with strangers."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(0) == 1:
"They're doing other boring stuff, but I can still have lots of fun by myself!"
{
-check_rep("apathy") == 1:
+[Must get boring after a while]
->boring
}
- else:
"They're away right now. I wish they would play with me" she remarks dejectedly.
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
The girl stops in her tracks and looks back at you.
{
-check_mood(0) == 3:
"You can't tell me what to do" She says sticking her tongue out. "You're not my dad."
{
-check_rep("aggression") == 1:
+[Intimidate her]
->mean
}
- else:
"What is there to say? There's nothing here for you."
}
+[Leave him be]
->END
+[Back]
->choices
==sad==
The girl turns away from you and pouts immensely. "Meanie, meanie. Big meanie" she mutters to herself.
~rep  = "apath_true"
->END
==race==
You easily wipe the floor with her when it comes to the race. She's breathing quite heavily as she looks towards you "Wow, you're amazing."
~rep = "prag_true"
->END
==play==
You decide to play with the girl for a bit longer. After a while she's beaming with happiness and hugs you. "That was lots of fun, let's play again sometime."
~rep = "emp_true"
->END
==boring==
The girl sticks her tongue out at you "No it doesn't, dummy." She makes several other noises and gestures before pouting at you.
~rep = "apath_true"
->END
==mean==
You glare at the girl, approaching her menacingly as you repeat yourself more loudly. She's quite frightnened and just silently nods in agreement with your request.
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1