# 2.0.0

Full Rewrite

# 1.3.0
now  

- `Some(1) != 1`  
- `None() == None()`  

# 1.2.4
Fix lib/src/maybe.dart. (-0.50 points)  
Analysis of lib/src/maybe.dart reported 1 hint:  
line 28 col 28: Avoid types as parameter names.  

Fix lib/src/none.dart. (-0.50 points)  
Analysis of lib/src/none.dart reported 1 hint:  
line 18 col 28: Avoid types as parameter names.  

Fix lib/src/null.dart. (-0.50 points)  
Analysis of lib/src/null.dart reported 1 hint:  
line 12 col 44: Avoid types as parameter names.

# 1.2.3
Rewritten implementation  

Fix bug: eq  
- `Some(1) != 1`  

now  
- `Some(1) == 1`  

Add eq test

# 1.2.2
remove const None  
Fix bug: const None<Null> is not Maybe<T>

# 1.2.1
Fix bug(`null.dart`): `defaultVal` and `defaultValFn` when `Some` while return `None`

# 1.2.0
Fix bug: `defaultVal` and `defaultValFn` when `Some` while return `None`

# 1.1.1
const None

# 1.1.0
Add const constructor

# 1.0.1
Add example

# 1.0.0
Create this