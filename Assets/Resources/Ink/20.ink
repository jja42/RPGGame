EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
There's a good deal of whistling coming from this man, his sing song attitude backing his toil as he works the valley's fields.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What are you doing?]
->converse
+[Need any help?]
->ally
+[What can you tell me about this place?]
->war
+[What do you think about the war?]
->place
+[Leave him be]
->END
=== identity ===
The man doesn't respond at first, seemingly lost in his work, but he quickly acknowledges you
{
-check_mood(0) == 1:
He smiles widely "I'm the best farmer around, I love this work." 
{
-check_rep("apathy") == 1:
+[Really]
->really
}
- else:
"I'm just your average farmer, sir."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man points to his field and his tools as he looks your way.
{
-check_mood(0) == 1:
"I'm working the field same as always, hard work but good work."
{
-check_rep("pragmatism") == 1:
+[What's good around now?]
->crops
}
- else:
"Planting crops and working hard, not exactly fun but necessary."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The man perks up a bit, seeming glad to recieve some help but he has some momentary hesitations.
{
-check_mood(0) == 2:
"No no it's quite alright. I can handle this without anyone else on my field."
{
-check_rep("apathy") == 1:
+[Why so jumpy?]
->jumpy
}
- else:
"Nah, I'll be alright, thanks."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
He looks around a bit confused why you're asking.
{
-check_mood(0) == 2:
"What? Something wrong with the place? Nothing odd's going on here."
{
-check_rep("aggression") == 1:
+[Press Him]
->press
}
- else:
"It's just a field in a village, nothing special."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(0) == 3:
"The war's for losers. I'd never join that damned mess. I'll be a farmer no matter what." He seems to have gotten a bit heated
{
-check_rep("empathy") == 1:
+[Are you alright?]
->care
}
- else:
"The war's messy, but it's almost over soon."
}
+[Leave him be]
->END
+[Back]
->choices
==crops==
The farmer runs you through which crops are good now and where to get a good supply. You thank him and go off.
~rep  = "prag_true"
->END
==really==
You doubt the man's enjoyment of his back-breaking craft. However, he holds strong under pressure. "I swear I wouldn't trade this for the world."
~rep = "apath_true"
->END
==jumpy==
The man laughs nervously. "What do you mean? I'm completely cool. Calm, collected, not nervous. Everthing's just peachy."
~rep = "apath_true"
->END
==press==
You use your superior figure to intimidate the man. He folds after a bit "Alright so I skipped out on conscription. Please just let me be a farmer in peace. I beg ya."
~rep = "agg_true"
->END
==care==
Your concern seems to have sparked a bit of honesty in the man "Yeah I'm fine, I just don't care for the war at all. It's a waste of people's lives and I won't waste mine."
~rep = "emp_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1