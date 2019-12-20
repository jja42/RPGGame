EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
The woman doesn't meet your gaze, instead looking away from you. She attempts to slip by you, but you manage to catch her before she does so.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[Why do you look away?]
->converse
+[Are you going somewhere?]
->ally
+[What do you do?]
->war
+[What do you think about the war?]
->place
+[Leave him be]
->END
=== identity ===
The woman doesn't look towards you, instead muttering a non-comittal answer.
{
-check_mood(0) == 3:
Her words are inaudible, it's quite clear that's he very uncomfortable in this social situation.
{
-check_rep("apathy") == 1:
+[Could you repeat that]
->repeat
}
- else:
"I'm nobody, I have somewhere to be."
}
+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The woman hesitates for a moment, trying again to slip past. She lets out a weak sigh and looks towards you for a second.
{
-check_mood(0) == 1:
"Sorry, I'm not too comfortable with strangers"
{
-check_rep("pragmatism") == 1:
+[Then let's not be strangers]
->stranger
}
- else:
"I'm just not comfortable right now, please move. "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The woman nods softly, hoping that gets the message across. With a bit of buildup she speaks as well.
{
-check_mood(0) == 2:
"C'mon, get out of my damn way. Stop pestering me, you freak."
{
-check_rep("apathy") == 1:
+[Shrug Indifferently]
->shrug
}
- else:
"Yes, I am. Please I've got to get there now."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
"I'm .. I ..." She trips over her words a bit before pausing.
{
-check_mood(0) == 1:
"I'm a noble, please this is really embarassing, could you let me pass?"
{
-check_rep("empathy") == 1:
+[Abide]
->abide
}
- else:
"I'm a very important person, please clear the way for me."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
The woman pauses for a second, a bit confused before looking towards you.
{
-check_mood(0) == 3:
She remains completely silent, a mix of strenuous emotions plastered on her face.
{
-check_rep("aggression") == 1:
+[Pressure him to answer]
->answer
}
- else:
"Why are you asking? I don't have any thoughts on it.."
}
+[Leave him be]
->END
+[Back]
->choices
==repeat==
She repeats the phrase once more inaudibly and stares at you, hoping that you'll go away. She cowers a bit as you stand unsatisfied and unmoving.
~rep  = "apath_true"
->END
==shrug==
She sighs and looks down at the ground in defeat, unsure of what to do. She eventually manages to slip by.
~rep = "apath_true"
->END
==stranger==
She laughs very ackwardly at your proclamation. After a long ackward silence, she nods and you two pretend to be friendly for a moment.
~rep = "prag_true"
->END
==abide==
You simply nod and step aside. The woman utters a small "Thank you" as she moves forward, passing you by.
~rep = "emp_true"
->END
==answer==
You repeat your question several times, raising your voice a bit at the woman. She's clearly flustered and scared but she forces an answer "I ... I don't know much about it."
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1