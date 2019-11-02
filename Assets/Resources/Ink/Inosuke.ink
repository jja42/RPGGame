EXTERNAL check_rep(x)
VAR rep = ""
"What brings you here traveller?"

{
-check_rep("empathy") == 1:
+ [To give back to this world]
~rep  = "emp_true"
    -> emp
}
+ [To seek the truth] 
~rep = "prag_true"
-> prag
+ [No reason]
~rep = "apath_true"
    ->apathy
+[To grow stronger]
~rep = "agg_true"
    ->agg


=== emp ===

"A pure and noble heart, I see."
    -> END


=== prag ===
"Is the truth worth the journey?"
-> END

=== apathy===
"Hmph."
->END

===agg===
"Watch yourself, traveller"
->END
=== function check_rep(x) ===
// Usually external functions can only return placeholder
// results, otherwise they'd be defined in ink!
~ return 1