# InvokeAI-AHK-prompting-assist
This a .ahk (Autohotkey) script for improving InvokeAI prompting expierience. 

---

# Prerequisites:

You need AutoHotkey tool for running the script. Get it by link:
https://www.autohotkey.com/

or at MS Store:
https://apps.microsoft.com/detail/9plqfdg8hh9d?hl=en-US&gl=US

---

This script performs operations to speed up prompting in InvokeAI by applying a syntax methods described in invoke documentation:
https://support.invoke.ai/support/solutions/articles/151000096723-advanced-prompting-syntax
https://support.invoke.ai/support/solutions/articles/151000158854-dynamic-prompting

---

### Features:
1. Add weight to (selection)+-.
Increase weight hotkey: alt +
Decrease weight hotkey: alt -
- this adds round brackets around selected text and puts - or + symbol after.
 For now script cant change weight further more multiple times or switch symbol by pressing hotkey multiple times, you need to change amout of signs manually, but it still speeds up prompt weighting a lot for me.

2. Add () round brackets around (selection)
Hotkey: alt (
- simply adds a brackets around selected text

3. Add "" around "selection",
Hotkey: alt '
- simply adds a "" around selected text

4. Add dynamic prompt construction { selection | var2 | var3 | var4 }
Hotkey: alt d
- adds dynamic prompt construction as it described in Invoke documentation, with 4 variables. Selection will be put in first slot. You can change variables manually later.

5. Add random dynamic prompt construction { 2$$ selection | var2 | var3 | var4 }
Hotkey: alt d
- adds random dynamic prompt construction as it described in Invoke documentation, with 4 variables. Selection will be put in first slot. You can change variables and selector value (2$$) manually later.

6. Add Prompt Blend constuction ("selection", "prompt2").blend(1,1)
Hotkey: alt b
- adds blending construction with selection in first slot.

7. Adds Add construction ("selection", "prompt2").and()
Hotkey: alt a
- Add construction is outdated and I'm not sure is it working now in Invoke. Sometimes it still helps define different characters, but there is no official info in Invoke documentation about it. Anyways i leave it in script for now.
