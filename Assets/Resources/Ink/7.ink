EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
 As you approach the soldier your eyes lock and before you can blink, he's already retrieved his blade "Come for a challenge, have you?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[What's this about a chalenge?]
->ally
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The mankeeps his eyes on you as he pauses before speaking, assessing you.
{
-check_mood(4) == 2:
"I am a gentleman positing a challenge to a seemingly unsavory stranger." 
{
-check_rep("aggression") == 1:
+[Take his bait]
->challenge
}
- else:
"I'm a noble soldier in charge of this town."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man smirks a bit as he continues to examine you and prod your personal space.
{
-check_mood(4) == 3:
"I'm a protector of this village. The lives of the citizens rest firmly upon my shoulders."
{
-check_rep("apathy") == 1:
+[Seems like an unneccesary burden]
->protected
}
- else:
"I'm a guardian, keeping the village safe of course."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The man brings his blade closer to you, staring you deep in the eyes.
{
-check_mood(4) == 1:
"A knave such as yourself wouldn't understand. Commoners must be stripped of their pride by force."
{
-check_rep("aggression") == 1:
+[What's that supposed to mean?]
->argue
}
- else:
"You wouldn't understand. A challenge is a manly rite of passage."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(4) == 3:
"It's terrible, callously placing all of these people here in danger."
{
-check_rep("empathy") == 1:
+[Empathize]
->calm
}
- else:
"The war is a travesty honestly, it needs to be done immediately."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(4) == 2:
"This is the home of countless gentlemen, an uncountable number of noble folk and the utmost culture."
{
-check_rep("pragmatism") == 1:
+[How does one become so noble?]
->noble
}
- else:
"This is the last bastion of culture and art."
}
+[Leave him be]
->END
+[Back]
->choices
==challenge==
You ready yourself to take on the soldier's challenge, but he merely scoffs. "As if I'd waste my time with such a peasant."
~rep  = "agg_true"
->END
==protected==
"How dare you besmirch the good people of this town. You ought to be cast out of here immediately."
~rep = "apath_true"
->END
==argue==
The soldier frowns deeply "You know exactly what I meant, don't make me repeat myself, goodness!"
~rep = "agg_true"
->END
==calm==
"I'm glad you can understand how terrible all of this conflict is. These people don't deserve such turmoil."
~rep = "prag_true"
->END
==noble==
The man scoffs "Attempting to usurp a position in the high class? You'll need to figure out that part on your own."
~rep = "emp_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1