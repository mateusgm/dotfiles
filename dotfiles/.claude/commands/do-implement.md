1. Understand the big picture of what we're trying to do from $ARGUMENTS/spec.md
2. Open $ARGUMENTS/todo.md and $ARGUMENTS/plan.md to understand the plan and identify incompleted tasks 
3. For each incomplete task spin up a sub agent with clear and self-contained context to:
    - fetch main from origin, rebase against it and create a new branch
    - double-check if it's truly unfinished and skip to the next task if so
    - implement it as described. DO NOT DEVIATE FROM THE PLAN. 
    - Commit frequently. TDD, DRY, YAGNI ruthlessly.
    - dont adjust safeguards without asking my approval.
4. When the task is done, spin up a sub agent to review it with clear and self-contained problem focused context (dont give details about the solution):
    - inspect the code with a fresh and critical view to ensure the implementation solves all requirements, doesnt do anything else, doesnt overcomplicate the solution and its not missing tests.
    - address critical and important points
    - Update $ARGUMENTS/todo.md to mark this task as completed
    - Push the branch to origin and open up a PR.
5. Repeat with the next unfinished task

Think carefully and only action the specific task I have given you with the most
concise and elegant solution that changes as little code as possible.
