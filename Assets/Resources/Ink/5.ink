EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
 The soldier glares at you as you approach. It's clear he doesn't seem to trust you one bit. "What business do you have here, foreigner?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[What's do you have against foreigners?]
->ally
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The man maintains his glare on you as he pauses before speaking, assessing you.
{
-check_mood(4) == 1:
"Who I am is none of your business, you damned lout. Make yourself sparse, soon." 
{
-check_rep("aggression") == 1:
+[Get in his face]
->glare
}
- else:
"I'm a soldier plainly."
}
You pause, half expecting a continued response, but it never comes.

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man sighs, seemingly offended by your continued existence and presence.
{
-check_mood(4) == 2:
"I protect this village. The lives of these people far outweighs the value of my own."
{
-check_rep("empathy") == 1:
+[The people must always be protected]
->protected
}
- else:
"I'm just a simple guard, bother someone else. "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The man puffs out his chest, attempting to appear far larger and stronger than he is as he looks down at you.
{
-check_mood(4) == 3:
"Honestly? I'm just a bit caught up in the war mentality. I've never seen you around so I'm just on guard."
{
-check_rep("apathy") == 1:
+[Is this a joke to you?]
->foreign
}
- else:
"You wouldn't understand. You foreigners are dangerous threats to this village"
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(4) == 1:
"Damn you, the war will be over soon and you'll regret antagonizing this village"
{
-check_rep("pragmatism") == 1:
+[Calm him]
->calm
}
- else:
"The war is none of your business, civilian"
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(4) == 2:
"This is the mighty home of our wonderful people. Countless souls have flourished here through the graces of the gods."
{
-check_rep("empathy") == 1:
+[Applaud his devotion]
->applaud
}
- else:
"What is there to say? There's nothing here for you."
}
+[Leave him be]
->END
+[Back]
->choices
==glare==
You jaunt up to the man, matching his glare with one of your own. The both of you hold your glares as long as possible, lamenting the other's existence.
~rep  = "agg_true"
->END
==protected==
Your agreement with his values catches the man slightly off guard. He just nods for a moment "Indeed, perhaps you're not all bad."
~rep = "emp_true"
->END
==foreign==
The soldier frowns deeply in response to your claim. "No this is not a joke! I knew there was something wrong with you, damned foreigner"
~rep = "apath_true"
->END
==calm==
You wait for him to cool down before confronting him about his anger. He sighs and apologizes "I was a bit out of line, just watch yourself, alright?"
~rep = "prag_true"
->END
==applaud==
You applaud the man's apparent devotion to his village. He gives you a light bow and a smile "You're a good guy for a foreigner" 
~rep = "emp_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1