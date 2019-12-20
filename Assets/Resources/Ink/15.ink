EXTERNAL check_rep(x)
VAR rep = ""
EXTERNAL check_mood(x)
There's an audible sigh from the young boy, he frowns a bit as he looks up to you. He recites his next statement with a false practiced cheer "Can I help you mister?" 
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What's wrong?]
->converse
+[What can you tell me about this place?]
->ally
+[Where are your parents?]
->war
+[What are you doing out here?]
->place
+[Leave him be]
->END
=== identity ===
The boy grimaces a bit. He clearly doesn't want to have a conversation with you right now.
{
-check_mood(0) == 1:
He moves to walk away from you "Stop messing around and wasting my time. Don't you have something better to do?" 
{
-check_rep("apathy") == 1:
+[Shrug]
->shrug
}
- else:
"What does it matter to you? What do you want?"
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The boy's stare at you for a while, unsure if you actually care or are just making small talk.
{
-check_mood(0) == 2:
"I'm just bored and lonely. This town sucks."
{
-check_rep("empathy") == 1:
+[Talk it out]
->talk
}
- else:
"Idiot. Nothing's wrong with me."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
As you ask, he stares at you for a second considering what to say.
{
-check_mood(0) == 3:
"What is there to say?  Why are you bothering me about this? You have eyes don't you?"
{
-check_rep("apathy") == 1:
+[I guess]
->eyes
}
- else:
"It's just a village, nothing too special about it, 'cept the mysticism stuff the adults talk about sometimes."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
He pauses for a moment, looking away and grumbling before looking back.
{
-check_mood(0) == 2:
"I don't know. They're just gone."
{
-check_rep("pragmatism") == 1:
+[Wanna come with me?]
->come
}
- else:
"That's really none of your business, is it?"
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(0) == 1:
"You're asking too many questions. Keep talking and you're gonna get hurt, old man."
{
-check_rep("aggression") == 1:
+[Take him on]
->tussle
}
- else:
"I'm just wandering I guess. It's not illegal or anything and I'm not bothering anyone."
}
+[Leave him be]
->END
+[Back]
->choices
==talk==
You talk with the boy for a good while, expressing that you wish him well and reassuring him that he's not at fault for his loneliness.
~rep  = "emp_true"
->END
==shrug==
You shrug wordlessly. The boy exhales loudly and stomps off mumbling something about stupid adults.
~rep = "apath_true"
->END
==eyes==
"Well then use them" The boy just shakes his head and begins to walk away in disbelief at your comment.
~rep = "prag_true"
->END
==come==
The boy looks at you like you have two heads. "What? .. No I'm alright, thanks. I'll make it on my own."
~rep = "prag_true"
->END
==tussle==
You stare the boy down and he returns the gesture. Eventually he leaps at you, but you easily fend him off, shoving him down. He picks himself up, dusts himself off and walks away silently.
~rep = "agg_true"
->END
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1