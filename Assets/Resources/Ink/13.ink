EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
The man before you gives you an odd look, "Do you need something?" he asks in a pompous manner, seemingly offended by your presence.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[Are you two together?]
->converse
+[What do you do?]
->ally
+[Where are you going?]
->place
+[What do you think about the war?]
->war
+[Leave him be]
->END
=== identity ===
The man scoffs as if your very question itself was ridiculous.
{
-check_mood(0) == 1:
He looks away from you with disdain "I am of the higher class, peasant. I should be known quite well by the gravel beneath me." 
{
-check_rep("apathy") == 1:
+[I've never heard of you]
->who
}
- else:
"Don't you know who I am? Goodness, foreigners are so troublesome."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man's eyes widen, he gives you a very careful examination, head to toe.
{
-check_mood(0) == 2:
"Why yes, the lady and I are soon to be wed. This is my dearly beloved so don't get any ideas."
{
-check_rep("pragmatism") == 1:
+[Too late for that]
->late
}
- else:
"And just who might you be to asked such a question? Direct your queries elsewhere."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The man fixes up his attire, polishing himself off as he turns his attention back to you.
{
-check_mood(0) == 2:
"I am but a humble servant of this fine village. A noble representation of its high class."
{
-check_rep("empathy") == 1:
+[Quite Impressive]
->applaud
}
- else:
"I am a high class noble, the picture of culture and sophistication."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
The man stops what he was doing and gives you a serious look as he considers your question.
{
-check_mood(0) == 1:
"This war is terrible. A tragedy that ails this land immensely."
{
-check_rep("apathy") == 1:
+[Comfort Him]
->comfort
}
- else:
"Such matters are far below me and unworthy of recognition."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(0) == 3:
"How presumptuous. Where we're going is none of your business."
{
-check_rep("aggression") == 1:
+[Pressure him to answer]
->answer
}
- else:
"We're off to a fancy event and we needn't spend much more time here."
}
+[Leave him be]
->END
+[Back]
->choices
==who==
The man's face reddens as he fumes a bit at your comment. "Why I never! Hmph" is all he can manage as he turns away.
~rep  = "apath_true"
->END
==late==
"You rapscallion." He chuckles a bit. "Though I must agree that she is quite an unstoppable gal so no harm done for now."
~rep = "prag_true"
->END
==applaud==
The man tips his hat to you. "Yes, yes. Tis grand to be appreciated as such. Thank you, sir."
~rep = "emp_true"
->END
==comfort==
You nod in agreement, empathizing with the man. He offers you a solemn nod in return and the two of you silently contemplate the issue together.
~rep = "emp_true"
->END
==answer==
The man's act crumbles quickly as he shows he true colors, cowering before you. "W-Well if you must know we're off to a ball right now."
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1