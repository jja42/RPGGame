EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
"New to town?" asks the merchant, "Looking for wares?" He gets much closer, perhaps a bit too close for comfort as he non-verbally gestures you towards his wares.
->choices
==choices==
+[Who are you?]
->identity
+[What do you have for sale?]
->converse
+[Where did you get all these wares?]
->ally
+[What can you tell me about this place?]
->war
+[What do you think about the war?]
->place
+[Leave him be]
->END
=== identity ===
The man chuckles a bit, once again getting far too close to you.
{
-check_mood(0) == 1:
He smirks slightly, "I am the king of sales, the magistrate of deals. You're going to make a good purchase today. I promise."
{
-check_rep("apathy") == 1:
+[I don't think so]
->no
}
- else:
"I am this town merchant of course."
}
You pause, half expecting a continued response, but it never comes.

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The man smiles comically wide as he guides you over directly to his wares.
{
-check_mood(0) == 2:
"Please take a look I have many items well suited to your taste"
{
-check_rep("pragmatism") == 1:
+[What's your best deal?]
->deals
}
- else:
"Come feast your eyes upon this unchallenged variety."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
The merchant seems a bit wary to answer that question, but he does so anyways.
{
-check_mood(0) == 3:
"Let's say I have my methods. When I want something I get it" He states once again breaking personal boundries.
{
-check_rep("aggression") == 1:
+[Shove him away]
->shove
}
- else:
"Simple trading and good luck, my friend. That's it."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
The merchant shines, ready to give another sales pitch.
{
-check_mood(0) == 1:
"This is my kingdom, everything here goes through me. I buy and sell just about everything in this village, believe it or not."
{
-check_rep("pragmatism") == 1:
+[What are your profits?]
->profit
}
- else:
"This is my home village and the best place for making deals."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(0) == 3:
"This war is great, I've been able to sell so many things to so many people it almost makes me wish for more."
{
-check_rep("empathy") == 1:
+[Fix his morals]
->morals
}
- else:
"It's a mess of course, but there's business to be done regardless"
}
+[Leave him be]
->END
+[Back]
->choices
==no==
The merchant scowls, he seems very unpleased with your response. "I do not like that, my friend. We need to work together for good deals."
~rep  = "apath_true"
->END
==deals==
The merchant smirks a bit, trying to mislead you but you keep the conversation on track and actually do manage to find decent sales.
~rep = "prag_true"
->END
==shove==
You push the merchant away and he recoils greatly. He looks at you as if pained, but he quickly readjusts and ignores the interaction.
~rep = "agg_true"
->END
==profit==
He gives you a judgemental look, but waves off his concerns and tells you a great deal of how he makes money. Truly valuable experience.
~rep = "prag_true"
->END
==morals==
You stop the man and have a short talk about morality. You're not sure you've convinced him but he does feel bad about what he said.
~rep = "emp_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1