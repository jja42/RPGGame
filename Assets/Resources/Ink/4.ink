EXTERNAL check_rep(x)
VAR rep = ""
VAR money = 20
EXTERNAL check_mood(x)
EXTERNAL money_transfer(x)
 The soldier seems to be practicing her form, flowing her body seamlessly through the field as she moves gracefully. She turns her attention to you eventually "Yes?"
+[Continue]
->choices
==choices==
+[Who are you?]
->identity
+[What do you do?]
->converse
+[What were you doing?]
->form
+[What's going on in the war?]
->war
+[What can you tell me about this place?]
->place
+[Leave him be]
->END
=== identity ===
The soldier smirks a bit, finding the question a bit comical. She bows deeply to you.
{
-check_mood(3) == 1:
"Why, I'm merely the greatest soldier in all the lands."
{
-check_rep("pragmatism") == 1:
+[Recruit her]
->flatter
}
- else:
"I'm a fine guard for this lovely town."
}

+[Leave him be]
->END
+[Back]
->choices
=== converse ===
The soldier flourishes her weapon once more, drawing a bit nearer as she does so.
{
-check_mood(3) == 3:
She chuckles maliciously as she brings the weapon far too close for comfort. She carefully guides it as close as possible as she weaves around you. "I protect this village of course."
{
-check_rep("aggression") == 1:
+[Tell her to back off]
->sadist
}
- else:
"I keep guard of this village, watching over it in case we're raided or looted."
}
+[Leave him be]
->END
+[Back]
->choices
=== form ===
Her expression changes as she perks up a bit, glad someone has any appreciation for the art.
{
-check_mood(3) == 2:
"That was the ancient kata of my people. I am proud to carry on the traditions to the best of my abilities."
{
-check_rep("apathy") == 1:
+[It was lame]
->shrug
}
- else:
"Oh, that was a weapon form. I've got to keep my skills sharp, y'know."
}
+[Leave him be]
->END
+[Back]
->choices
=== war ===
{
-check_mood(3) == 1:
"The war'll end soon enough, you just wait. Our forces are gonna destroy the others."
{
-check_rep("empathy") == 1:
+[Rejoice]
->comfort
}
- else:
"The war's going as well as it can, given all the fighting."
}
+[Leave him be]
->END
+[Back]
->choices
=== place ===
{
-check_mood(3) == 2:
"This is the sacred site by the river, gifted to us by the gods, upon which my ancestors crafted a glorious village."
{
-check_rep("pragmatism") == 1:
+[How was this site blessed?]
->happy
}
- else:
"This is the grounds from which the Water village has flourished"
}
+[Leave him be]
->END
+[Back]
->choices
==flatter==
Your words elicit a content giggle from the woman. She shakes her head as she speaks with a smile. "Your flattery is grand. Unfortunately, I've already commited to my duties here."
~rep  = "prag_true"
->END
==sadist==
The soldier seems to laugh contentedly at your apparent suffering, tormenting you a short while longer before backing away as she notes your anger.
~rep = "agg_true"
->END
==shrug==
You brush off the skill and grace of the kata. This seems to offend the soldier, but she holds her emotions back, sparing you from a tirade. She merely scoffs instead.
~rep = "apath_true"
->END
==comfort==
You join in on the soldier's bold declaration, whooping and hollering a bit. You both pump your fists up in a signal of immiment triumph.
~rep = "emp_true"
->END
==happy==
The soldier's explains a bit of the village's beliefs before listing off the supposed blessings. "The river provides pure drinking water that gives us power and energy to overwhelm our foes and imbues us with grace through a deep connection with the planet."
~rep = "prag_true"
->END
=== function money_transfer(x) ===
~return 1
=== function check_rep(x) ===
~ return 1
=== function check_mood(x) ===
~ return 1