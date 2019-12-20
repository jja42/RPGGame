EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
"What do you want?" asks the man, engrossed in his planting. He tills some more land before looking back over to you "C'mon now, spit it out."
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[Need any help?]
->ally
+[What are you doing?]
->war
+[What do you think about the war?]
->place
+[Leave him be]
->END
=== identity ===
The man chews on some wheat, looking at you with his head tilted.
{
-check_mood(16) == 2:
He frowns a bit, "I don't have time to be wastin answering that, can't you see I got a field to work?" 
{
-check_rep("pragmatism") == 1:
+[What are you growing?]
->grow
}
- else:
"Who are you to be asking who I am? Huh?"
}
You pause, half expecting a continued response, but it never comes.

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man perks up a bit and gives you an odd look as if the answer should be quite apparent.
{
-check_mood(16) == 1:
"The hell does it look like I do? Take one damn guess"
{
-check_rep("aggression") == 1:
+[Wasting your damn time]
->argue
}
- else:
"I'm a farmer of course, I sow the land with crops."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The man pauses for a moment and takes a look back towards his fields. He cracks his back before responding.
{
-check_mood(16) == 3:
"Well, I would appreciate some help. Sure is a lot of work to do now."
{
-check_rep("empathy") == 1:
+[Help out]
->help
}
- else:
"I think I'll be alright."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
He looks up from working and just sighs very audibly as he looks over to you.
{
-check_mood(16) == 2:
"Well I'm trying to sow my crops, but I keep being interrupted quite rudely."
{
-check_rep("apathy") == 1:
+[That's a shame]
->shame
}
- else:
"I'm planting and working the land, I got lots to do so just let me be."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
The man tenses up a bit at the mention of the war. He looks around a bit before looking back to you.
{
-check_mood(16) == 3:
"What do you know about the war huh? What do you want from me?"
{
-check_rep("apathy") == 1:
+[What do you mean?]
->conscript
}
- else:
"The war's none of my concern, alright? Don't worry bout it."
}
+[Leave him be]
->END
+[Back]
->choices
==grow==
The farmer lists off some of the crops he's growing as well as what'll be ready for the next harvest and what's usually good this time of year.
~rep  = "prag_true"
->END
==argue==
You shout back and forth with the farmer, ultimately wasting more time. Eventually he gives up and just ignores you as he goes back to working.
~rep = "agg_true"
->END
==shame==
"It really is and I would really appreciate it if you would leave and not speak to me again."
~rep = "apath_true"
->END
==help==
It's long hard work, but you bust your back helping out the farmer and before long you two have gotten everything done. You exchange a handshake and he thanks you.
~rep = "emp_true"
->END
==conscript==
You kinda shrug at the man and he sighs "Listen up, I'm not going to that damn war so keep me out of talks like this and search somewhere else."
~rep = "apath_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1