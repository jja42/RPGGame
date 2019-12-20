EXTERNAL check_rep(x)
VAR rep = ""
VAR money = 20
EXTERNAL check_mood(x)
EXTERNAL money_transfer(x)
The soldier looks at you inquisitively. He glances up and down, taking your appearance in as he mulls something over. "Not from around here, eh?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[What's wrong with your ally?]
->ally
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The soldier tilts his head at you in a bit of disbelief. Surely the uniform made his identity clear.
{
-check_mood(1) == 2:
"What's it look like I am? Can't you tell?" He says gesturing to his outfit."
{
-check_rep("aggression") == 1:
+[Escalate the situation]
->tussle
}
- else:
"Well, I'm a soldier, I was shipped back to keep watch over the village"
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The soldier sighs a bit, perhaps unhappy to not be serving on the front lines or perhaps just unhappy in general with the need for his position.
{
-check_mood(1) == 3:
"Not much, honestly. I mostly just stand here and relax. Pretend the war hasn't killed me on the inside."
{
-check_rep("pragmatism") == 1:
+[Perhaps you'd like to join my journey]
->journey
}
- else:
"I keep guard of this village, watching over it in case we're raided or looted."
}
+[Leave him be]
->END
+[Back]
->choices
=== ally ===
As you ask, the man's gaze turns towards the other soldier and for a moment his neutral expression changes into a frown as he shakes his head slowly.
{
-check_mood(1) == 3:
"The guy was torn up in battle. He survived physically, but mentally he's almost always gone. I wonder if he can think of anything except combat."
{
-check_rep("apathy") == 1:
+[He shouldn't be alive]
->shrug
}
- else:
"He's fine, don't worry too much about him."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(1) == 1:
"Don't worry about the war, focus on making yourself welcome here. We'll move past this whole thing."
{
-check_rep("pragmatism") == 1:
+[Help me feel more welcome]
->comfort
}
- else:
"The war's going, not much else to say than that."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(1) == 1:
"This is my home, greatest place I've ever known. You're welcome to enjoy it to the fullest."
{
-check_rep("empathy") == 1:
+[Share your excitement]
->happy
}
- else:
"This is the home of us Fire people, the Fire village if you will."
}
+[Leave him be]
->END
+[Back]
->choices
==tussle==
After a rather heated shouting match with each other and a rather sloppy fist fight, you both find each other glaring towards the other.
~rep  = "agg_true"
->END
==shrug==
The soldier seems a bit upset, but the lack of emotion in your voice leads him to think for a bit. He just shrugs a bit "Perhaps"
~rep = "apath_true"
->END
==journey==
He offers you a slight chuckle "Sorry, I've got obligations here, pal."
~rep = "prag_true"
->END
==comfort==
He raises an eyebrow at first, but he quickly gets the message. He slips you some gold and sends you on your way.
~rep = "apath_true"
~money_transfer(money)
->END
==happy==
The soldier's ecstatic to have found someone just as enthusiastic about his town. You two share a good round of banter and shake hands. 
~rep = "emp_true"
->END
=== function money_transfer(x) ===
~return 1
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1