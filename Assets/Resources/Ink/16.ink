EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
"Come here, mister" the young girl says before dragging you along. She brings you to an unassuming area before turning to you. "The great sorceress will now speak"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What are you doing?]
->converse
+[Are you a real sorceress?]
->ally
+[Where are your parents?]
->war
+[Where are we?]
->place
+[Leave him be]
->END
=== identity ===
The girl giggles a bit, making flashy movements as she prepares her introduction.
{
-check_mood(0) == 1:
She grins widely. "I am the one and only great grand sorceress! Bow down and worship me!"
{
-check_rep("pragmatism") == 1:
+[Bow Down]
->bow
}
- else:
"I'm a magical girl, a great sorceress."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The girl twirls around, using a stick as a wand and some fabric as a cape.
{
-check_mood(0) == 3:
"I'm contacting the underworld for knowledge."
{
-check_rep("apathy") == 1:
+[Yeah sure you are]
->home
}
- else:
"I'm practicing my magic so I can be the best sorceress. "
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
As you ask, she strikes some more poses and chants some more incantations with her wand in hand.
{
-check_mood(0) == 2:
"No of course not silly" she says giggling. "I can't do real magic, I'm just having fun."
{
-check_rep("empathy") == 1:
+[Join her game]
->play
}
- else:
"Of course, I'm just practicing for now though."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
She sort of just shrugs, trying to play the question off. After a bit though she responds.
{
-check_mood(0) == 2:
"They're at home, I told them I was gonna go out and play for a bit."
{
-check_rep("aggression") == 1:
+[Scare her away]
->scare
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
"This is the nearest spot with the most magical energy." She places a hand down on the ground. "You can feel it if you try."
{
-check_rep("pragmatism") == 1:
+[Place a hand down]
->hand
}
- else:
"This is just a spot I like to play in."
}
+[Leave him be]
->END
+[Back]
->choices
==bow==
You kneel before the girl, catching her off guard at first, but she adapts. She pulls out a stick, dubbing it her magic wand and casts a protection spell on her loyal disciple.
~rep  = "prag_true"
->END
==scare==
You tell the girl to scram. She seems confused and reluctant. However after you intimidate her she runs without much argument.
~rep = "agg_true"
->END
==home==
The girl says nothing as she recites an incantation. Soon afterwards she touches the wand to your head. You suddenly feel a lot wiser at least.
~rep = "apath_true"
->END
==play==
You join in on the theatrics, appointing yourself her apprentice and waving around a stick as well, pretending and having fun.
~rep = "emp_true"
->END
==hand==
You place a hand down and you can actually feel some magic energy pulsing its way into your body. How interesting.
~rep = "prag_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1