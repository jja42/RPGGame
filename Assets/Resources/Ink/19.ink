EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
The man before you seems oddly absorbed in his work, scribbling furiously on a notepad before turning back to a canvas and slowly adding strokes.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What are you doing?]
->converse
+[What's your method?]
->ally
+[Are you painting something in particular?]
->war
+[What do you think about the war?]
->place
+[Leave him be]
->END
=== identity ===
The boy does stop what he is doing, barely seeming to have heard what you said, however he responds before you can speak up.
{
-check_mood(0) == 2:
He smirks slightly, "Soon to be a great artist I must now capture the essence of the craft". 
{
-check_rep("apathy") == 1:
+[What are you on about?]
->art
}
- else:
"I'm just an artist at work."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The boy's speed intensifies as he seems to reach some breakthrough but it quickly returns to normal pace.
{
-check_mood(0) == 1:
"Encapsulating my vision on this canvas. It is my duty."
{
-check_rep("apathy") == 1:
+[Really?]
->doubt
}
- else:
"I'm merely painting I hope it's not troubling you. "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
As you ask, he takes a small breather, putting his tools down.
{
-check_mood(0) == 2:
"I merely let the world guide my hand and the brush does all the work for me."
{
-check_rep("pragmatism") == 1:
+[Can you teach me?]
->learn
}
- else:
"It's a very complex cycle of observation and recreation."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
He shakes his head at this question, but his focus seems to change.
{
-check_mood(0) == 3:
"Sorry, nothing in particular, just having some fun."
{
-check_rep("empathy") == 1:
+[Encourage Him]
->encourage
}
- else:
"I draw what I feel even if I'm not sure what that is."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
He shrugs, seeming uninterested in the topic entirely.
{
-check_mood(0) == 1:
"It's not my place to comment on such things."
{
-check_rep("aggression") == 1:
+[So you're just ignoring it?]
->leave
}
- else:
"It's a shame but there's not much I can do."
}
+[Leave him be]
->END
+[Back]
->choices
==art==
The boy sighs a bit "It's not easy to explain, there nuance to every stroke to the entire visison itself."
~rep  = "apath_true"
->END
==doubt==
You roll your eyes a bit, but the boy remains unfazed, falling back into his repeated cycle.
~rep = "apath_true"
->END
==learn==
The boy pauses for a second and shrugs "He takes your hand and its as if he's possessed you, moving the brush quickly and accurately as if he was painting naturally.
~rep = "prag_true"
->END
==encourage==
You pat the boy on the back, praising his work. He smiles and nods thankfully "You're too kind really."
~rep = "emp_true"
->END
==leave==
The boy is a bit taken aback but he just nods. "I don't see how I can make the situation better by just feeling bad."
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1