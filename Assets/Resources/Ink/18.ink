EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
 A cheery gal smiles as she sees you approaching, "Good to see you" she says, giggling softly as she closes the distance.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[How are you doing?]
->converse
+[Why so happy?]
->ally
+[What do you do?]
->war
+[What do you think about the war?]
->place
+[Leave him be]
->END
=== identity ===
The gal giggles a bit at the question, thinking on how to best answer it.
{
-check_mood(0) == 2:
"I'm your number one fan, don't forget that."
{
-check_rep("pragmatism") == 1:
+[Prove it]
->proof
}
- else:
"I'm just a nice gal, nothing wrong with that is there?"
}

+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The girl blushes a bit, looking away for a moment to compose herself.
{
-check_mood(0) == 1:
"It's just a nice day out and I think you're a great guy."
{
-check_rep("empathy") == 1:
+[You're great too]
->great
}
- else:
"Oh, no reason. I just like to smile and be joyous. "
}
+[Leave him be]
->END
+[Back]
->choices
=== converse ===
She's a bit surprised "Little ol' me? You really wanna know?"
{
-check_mood(0) == 2:
"I'm doing oh so much better now that you've come around. You need to come around more often."
{
-check_rep("apathy") == 1:
+[Maybe]
->shrug
}
- else:
"Oh, I'm doing well. Nothing bad's happened to me and the days have been nice."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
She giggles a bit. You can't tell if she's a bit embarrased or if it's a knowing laugh.
{
-check_mood(0) == 3:
"I do .. some rather unsavory things. It's quite profitable."
{
-check_rep("pragmatism") == 1:
+[Show me]
->learn
}
- else:
"Just some field work, a bit of service work. Nothing fancy."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
"The war? ... What an odd topic."
{
-check_mood(0) == 3:
"I think it opens up some nice opportunities for evil."
{
-check_rep("aggression") == 1:
+[Press her on the matter]
->press
}
- else:
"It hasn't really impacted me that much."
}
+[Leave him be]
->END
+[Back]
->choices
==proof==
She gets really quite close to you and brings you in towards her with a tight hug. There's quite a bit of pressure and after a while you get the memo.
~rep  = "prag_true"
->END
==shrug==
You shrug without conviction, not really giving the thought much consideration. The gal seems a bit distraught and heartbroken but she just softly nods in acknowledgement.
~rep = "apath_true"
->END
==great==
She blushes heavily, giggling incesantly for a while before simply giving you a peck on the cheek "Thanks"
~rep = "emp_true"
->END
==learn==
She smiles slyly as she speaks of some dasterdly things she's done to manipulate others for money.
~rep = "prag_true"
->END
==press==
You glare at her and press her on the details. She admits that she's quite interested in all the violence and suffering. This enrages you a bit, but you leave it at that.
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1