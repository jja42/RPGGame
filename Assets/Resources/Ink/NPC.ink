VAR rep = ""
"Come brother, you must align your spirit with the interests of the Komani."

+ [I think not]
~rep  = "prag_true"
    -> disagree
+ [Indeed, brother] 
~rep = "agg_true"
-> agree


=== disagree ===
"The Komani's patience with you wanes, brother"
    -> ending


=== agree ===
"Your acceptance is noted, brother"
-> ending


=== ending

Your reputation with the Komani has changed
-> END