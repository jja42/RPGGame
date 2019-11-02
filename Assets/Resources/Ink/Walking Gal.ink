EXTERNAL check_item(x)
VAR rep = ""
VAR removeitem = ""
"My weary soul longs to hold a weapon once more"


+ [Take this sword]
{
-check_item("Sword") == 1:
~rep  = "emp_true"
    -> give
-else:
->refuse
}
+ [Weep in silence, wretch] 
~rep = "agg_true"
-> refuse


=== give ===

~removeitem = "Sword"
"Your kindness brings light to my world"
    -> END


=== refuse ===
"I shall continue searching"

-> END
=== function check_item(x) ===
// Usually external functions can only return placeholder
// results, otherwise they'd be defined in ink!
~ return 1