1. Open ./specs/$ARGUMENTS/todo.md and identify any tasks not marked as completed.
2. For each incomplete task:
    - Get context about the respective task from ./specs/$ARGUMENTS/plan.md
    - Double-check if it's truly unfinished (if uncertain, ask for clarification).
    - If you confirm it's already done, skip it.
    - Let me know if you have questions, otherwise, implement it as described. DO NOT DEVIATE FROM THE PLAN.
    - Look at the ./specs/$ARGUMENTS/spec.md to ensure your implementation aligns with the requirements.
    - Make sure the tests pass, and the program builds/runs
    - Commit the changes to your repository with a clear commit message.
    - Update ./specs/$ARGUMENTS/todo.md to mark this task as completed.
3. After you finish each group of sections, pause and wait for user review or feedback.
4. Repeat with the next unfinished task as directed by the user.

Think carefully and only action the specific task I have given you with the most concise and elegant solution that changes as little code as possible.
