EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
This soldier appears to be half asleep, yet somehow maintaining perfect posture as he dozes off whilst upright. Before you can ponder the matter, he mumbles out a "Huh?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[Were you sleeping?]
->ally
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The man keeps his eyes closed and you swear you can hear snoring before he responds.
{
-check_mood(5) == 2:
"I'm just a lowly soldier, sir. Just doing my duty." 
{
-check_rep("apathy") == 1:
+[Why bother when you're half asleep?]
->sleep
}
- else:
"I'm a guard for this here village."
}
+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man's eyes flitter open for just a second as he yawns. They promptly reclose themselves.
{
-check_mood(4) == 1:
"I do ..." he mutters before seemingly dozing off. He continues a few moments later "what I must."
{
-check_rep("empathy") == 1:
+[Are you alright?]
->care
}
- else:
"I just keep watch so that nothing bad happens to the village"
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The soldier shakes his head ever so slightly as if to indicate a no to your question.
{
-check_mood(4) == 3:
"This is a special technique designed to conserve energy so that I can act at peak efficiency at any hour of the day."
{
-check_rep("pragmatism") == 1:
+[Can you teach me?]
->learn
}
- else:
"No, I assure you I was keepin an eye on everything."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
The man ponders the question for a short while, mulling it over.
{
-check_mood(4) == 1:
He shrugs and seems to be stuck in that position for a while before abruptly stating "It's fine I guess."
{
-check_rep("aggression") == 1:
+[Don't you care at all?]
->anger
}
- else:
"The war is a real pain, it needs to end soon."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(4) == 3:
"This is ancestral home of my people. We were blessed with such a bountiful field due to our consistent patronage."
{
-check_rep("apathy") == 1:
+[Doesn't seem like much]
->home
}
- else:
"This is just our village, not much else to it."
}
+[Leave him be]
->END
+[Back]
->choices
==sleep==
The man's eyes open slowly for just a second as he stares into your soul for the moment. He closes them back up and sighs "I'm not sure myself."
~rep  = "apath_true"
->END
==care==
He nods despite seeming completely out of it. His body sways as he does so, further concerning you, but he assures you that he's fine.
~rep = "emp_true"
->END
==learn==
The soldier chuckles a slight bit "No this technique can only be passed down to people from my village."
~rep = "prag_true"
->END
==anger==
The man shakes his head slightly "It's not that simple. My emotions won't change the outcome at all."
~rep = "agg_true"
->END
==home==
The soldier seems slightly ticked, but he hides it well "You merely don't appreciate the beauty of our home. That's fine." 
~rep = "apath_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1