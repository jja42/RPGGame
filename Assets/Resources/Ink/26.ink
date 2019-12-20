EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
An elderly man stands still in the open air, staring idly out into the horizon. His blank expression speaks volumes in the silence of the clearing.
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
The boy does not avert his gaze, remaining focused on the unchanging horizon. He hesitates for a long while before speaking up.
{
-check_mood(0) == 1:
He smirks slightly, embracing the opportunity to preach a bit "A disciple of the sun, gazing upon its illumination." 
{
-check_rep("empathy") == 1:
+[Praise the Sun]
->sun
}
- else:
"Nobody, who cares? Just leave me alone."
}
You pause, half expecting a continued response, but it never comes.

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The boy's stare intensifies for a moment, his blank expression becoming focused as he half-heartedly searches for an answer.
{
-check_mood(0) == 3:
"This place is a good place, I like being here. It's safe here, mister."
{
-check_rep("pragmatism") == 1:
+[Perhaps I'll make this place my home]
->home
}
- else:
"I'm just standing. I'm not bothering anyone. "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
As you ask, your gaze turns towards the horizon as if hoping to see whatever has entranced the young man.
{
-check_mood(0) == 1:
"Isn't it beautiful? The way the light shines on the land is something ... something I adore."
{
-check_rep("apathy") == 1:
+[Shrug Indifferently]
->shrug
}
- else:
"Just look for yourself, you should understand."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(0) == 2:
"They ... they're gone. They left me. I've nowhere to go ..."
{
-check_rep("empathy") == 1:
+[Comfort Him]
->comfort
}
- else:
"I don't know. Go away."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(0) == 3:
"This is the ancestral homeland of my people, many have since moved towards the nearby village, but I want to preserve our traditions."
{
-check_rep("aggression") == 1:
+[Pressure him to leave]
->leave
}
- else:
"What is there to say? There's nothing here for you."
}
+[Leave him be]
->END
+[Back]
->choices
==sun==
You join the boy in giving praise to the sun, he seems delighted to have found a fellow believer.
~rep  = "emp_true"
->END
==shrug==
You shrug without conviction, not really giving the thought much consideration. The boy seems a bit offended but he doesn't say anything.
~rep = "apath_true"
->END
==home==
The boy laughs a bit, but he realizes your serious nature and gives you a strange look for a second before staring back towards the horizon.
~rep = "prag_true"
->END
==comfort==
You place a hand on the child's shoulder and reassure him that he'll find a home. He faintly sobs for a second before softly nodding.
~rep = "emp_true"
->END
==leave==
You glare at the boy, telling him that he needs to leave. He seems frightened, but he seems to stand his ground regardless whether through shock or resilience.
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1