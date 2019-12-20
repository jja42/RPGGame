EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
"Bam! Boom! Pow!" calls out the young boy. He seems to be playing by himself in the field with figures made of straw.
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What are you doing?]
->ally
+[Can I join you?]
->converse
+[Where are your parents?]
->war
+[Did you make those straw figures yourself?]
->place
+[Leave him be]
->END
=== identity ===
The boy looks up from his toys for a short while to face you.
{
-check_mood(0) == 2:
He smirks slightly "I am the almighty ruler of all the straw in the world. I have made this straw into men under my control."
{
-check_rep("pragmatism") == 1:
+[May I have some servants, lord?]
->straw
}
- else:
"I'm king of the straw men. Who are you mister?"
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The boy mulls it over for a few seconds before just shrugging and making space for you to sit.
{
-check_mood(0) == 3:
"I don't usually have friends to play with me. Can we play together for a while?"
{
-check_rep("empathy") == 1:
+[Play with him]
->play
}
- else:
"I guess so, just don't mess my stuff up."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
As you ask, he makes a few more straw men and has them battle each other.
{
-check_mood(0) == 2:
"I'm making my servants fight to the death to please me. Their sacrifices are in vein if they're not champions."
{
-check_rep("aggression") == 1:
+[Fight his straw men]
->fight
}
- else:
"I'm just having fun I guess, battling the straw men."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
He looks away for a bit, sighing before looking back your way.
{
-check_mood(0) == 2:
"They, they're not around really. I'm alone most of the time."
{
-check_rep("empathy") == 1:
+[Comfort Him]
->comfort
}
- else:
"Who cares, I don't need them to have fun by myself."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(0) == 1:
"Sure did" he exclaims with a smile. "It's not too hard and then they're lot of fun to play with."
{
-check_rep("pragmatism") == 1:
+[Teach me]
->learn
}
- else:
"Yeah I guess, it's not like it's hard to do."
}
+[Leave him be]
->END
+[Back]
->choices
==straw==
The boy sighs, but he does make some more straw men and hands them to you. With your new subjects in hand you rule a harsh monarchy for a while.
~rep  = "prag_true"
->END
==play==
You sit close to the boy and the two of you roleplay with your straw men for a while until the boy seems content. "Thanks mister, that was fun." 
~rep = "emp_true"
->END
==fight==
With your own straw men, you crush the young boy's servants, demolishing them ruthlessly. He begins to tear up a bit, but holds it back.
~rep = "agg_true"
->END
==comfort==
You let him know that you care and you've got his back as his friend. He thanks you and the two of you fist bump.
~rep = "emp_true"
->END
==learn==
The boy eagerly shows you how to construct your very own straw men and soon you have your own little legion of them standing guard.
~rep = "prag_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1