EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
An old woman stands before you, tending to her chores. As she notices you, she gives you a light wave before returning to her work.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[How are you today?]
->converse
+[Need any help?]
->ally
+[Are you all alone?]
->place
+[What do you think about the war?]
->war
+[Leave him be]
->END
=== identity ===
The woman turns her attention back to you, offering a slow smile.
{
-check_mood(0) == 2:
She speaks low and slow, cementing her words as she speaks "I'm just an old woman, no need for you to worry about me."
{
-check_rep("aggression") == 1:
+[Stop speaking like that!]
->anger
}
- else:
"Oh me? How sweet. Not many people ask about me anymore these days. I'm Matilda, dearie."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The woman ponders the question for a second. It seems she's not asked this often.
{
-check_mood(0) == 1:
"I'm having a wonderful day, sweetie. You've just made it even better."
{
-check_rep("pragmatism") == 1:
+[Do I get a reward?]
->reward
}
- else:
"I'm doing just great today, thank you."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
She hesitates for a moment, seeming a bit guilty about foisting any work onto you.
{
-check_mood(0) == 1:
"Oh I couldn't bring myself to give you any work darlin'. It'd be unfair to have you do my work for me."
{
-check_rep("empathy") == 1:
+[insist]
->help
}
- else:
"No, it's alright dearie. I can handle this on my own."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(0) == 2:
"This damned war. Whew it really riles me up. It's sickening, I'll tell ya what."
{
-check_rep("empathy") == 1:
+[Comfort Her]
->comfort
}
- else:
"Oh this war is beyond me, dearie. I don't think about it."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
"Oh, well I guess I am kind of alone in a sense, aren't I?"
{
-check_mood(0) == 2:
"Don't worry the loneliness doesn't bother me none. I've gotten used to it by now."
{
-check_rep("apathy") == 1:
+[Why would I worry?]
->worry
}
- else:
"What is there to say? There's nothing here for you."
}
+[Leave him be]
->END
+[Back]
->choices
==anger==
Your outburst startles the poor old woman. She seems heartbroken by your sudden anger and she turns away dejectedly.
~rep  = "agg_true"
->END
==reward==
Her face furrows a bit, but she keeps her smile. Why sure you do. Kindness ought to be rewarded.  
~rep = "prag_true"
VAR giveitem = "Potion"
->END
==help==
The old woman resists a bit but eventually she gives in, allowing you to help a bit. She thanks you immensely after you finish helping.
~rep = "emp_true"
->END
==comfort==
You place a hand on the her shoulder and after a while she stops fuming. "Thank you sonny, sometimes I just get too heated."
~rep = "emp_true"
->END
==worry==
"You're right. I suppose there is no reason to fret over an old eyesore such as myself."
~rep = "apath_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1