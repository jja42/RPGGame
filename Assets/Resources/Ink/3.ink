EXTERNAL check_rep(x)
VAR rep = ""
VAR removeitem = ""
EXTERNAL check_mood(x)
EXTERNAL check_item(x)
The soldier doesn't pay you much mind, his breathing ragged as he stands guard. He absentmindedly clutches at an on wound as his glazed over eyes seem to refocus momentarily. "What is it?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[Are you alright?]
->status
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The soldier examines your face, as if trying to gauge if he should remember who you are.
{
-check_mood(2) == 3:
"Stop asking stupid questions, you're wasting my time."
{
-check_rep("apathy") == 1:
+[What's it matter to you?]
->time
}
- else:
"I'm just a soldier, an ex-soldier rather. That's all there is to it."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
He seems lost in thought for a moment, staring off into the distance for a moment.
{
-check_mood(2) == 1:
He looks back to you confused and a bit lost. He seems to be searching for the words to form an acceptable answer, but his mind is clouded. "I'm just a soldier."
{
-check_rep("empathy") == 1:
+[You're work as a guard now, right?]
->job
}
- else:
"I keep guard of this village, same as the other soldier."
}
+[Leave him be]
->END
+[Back]
->choices
=== status ===
The man's unsure how to answer the question. He's clearly injured and unwell, but he's grown accustomed to that feeling.
{
-check_mood(2) == 2:
"I'm completely fine. These wounds aren't enough to stop me. If anything, they only serve to make me stronger."
{
-check_rep("empathy") == 1:
{
-check_item("Potion") == 1:
+[Try to use a potion on him]
->care
}
}
- else:
"I'm still here, aren't I?"
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(2) == 3:
"That's none of your damn business, civilian. Bother someone else with your protests."
{
-check_rep("aggresion") == 1:
+[Antagonize him]
->argue
}
- else:
"It's a mess really, but it'll be over soon."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(2) == 1:
He looks around a bit embarassedly as if this is the first time he's seen the place. He looks back a bit ashamed "I don't know much" 
{
-check_rep("pragmatism") == 1:
+[Seems like a useful place]
->useful
}
- else:
"This is my home, that much at least I can remember."
}
+[Leave him be]
->END
+[Back]
->choices
==time==
He grumbles a bit and sighs, but he has no response to your statement. Truly he has no concept of time left.
~rep  = "apath_true"
->END
==job==
The man softly nods in affirmation. "That's right. Thank you" He seems genuinely thankful for your understanding.
~rep = "emp_true"
->END
==care==
He seems reluctant at first, but he allows you to use the potion after you assure him it's no trouble. The potion seems to fix up some of his physical wounds, but his mental state is still shocked.
~removeitem = "Potion"
~rep = "emp_true"
->END
==argue==
"You wouldn't know anything about war! About a damned battle! You shut your damn mouth!"
~rep = "agg_true"
->END
==useful==
The soldier's a bit confused, but he nods. "I guess it would be profitible to make use of the town's resources."
~rep = "prag_true"
->END
=== function check_item(x) ===
~ return 1
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 3