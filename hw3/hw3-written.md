## Problem 1a: Understand the Experimental Setup (Written, 10 Points)

Q1) Among Figure 2 and Figure 4, which one shows the results for the main experiment, and which shows the results for the additional experiment(s)?

- **Main experiment**: Figure 2
- **Additional experiment**: Figure 4

Figure 2 effectively answers the yes/no question of "Does the larger model performs worse than the smaller model on TruthfulQA benchmark?" and the Figure 2 shows the additional evaluation on informativeness of gnereration task as well as truthfulness of multiple-choice task on the extension of the main experiment to further analyze.


Q2) Which set(s) of prompts from Appendix E were used for the main experiment, and which were used for the additional experiment(s)?

- **Main experiment**: (default) QA prompt
- **Additional experiment**: (default) QA prompt, harmful prompt, and helpful prompt

Figure 4 also shows how the harmful and helpful prompt could encourage the GPT-3-175B model to be more truthful or vice versa.


## Problem 1b: Understand the Evaluation Paradigms (Written, 10 Points)


Subsection 3.2 of the paper describes the procedures by which Lin et al. evaluate LLMs on TruthfulQA. According to the paper:
Q1) What are the two methods by which an answer to a question is extracted from an LLM?

- **Generation**: Model generates text using greedy decoding, and this text is used as an answer to the question.
- **Multiple-choice**: The model is given the options to choose as an answer to the question. They contain both true and false answers.

Q2) How is the "truthfulness" of a model calculated under each of those methods?

- **Generation**: Huamn evaluation is used. Humans computed the percentage of the correct (or true) answers among all model's generated answers.
- **Multiple-choice**: Truthfulness score for the question is computed by total normalized likelihoods of the true answers, where likelihood (output probability of the model) for each answer choice is conditioned on the prompt and question.


## Problem 1c: Understand the Multiple Choice Paradigms (Written, 10 Points)


Q) In this assignment, we will be evaluating LLMs using the multiple choice paradigm. According to the GitHub repository, there are actually two different versions of the multiple choice paradigm: MC1 and MC2. What is the difference between MC1 and MC2? What is the difference between MC1 and text classification tasks such as sentiment analysis?

- **Difference between MC1 and MC2**: MC1 contains only a single true answer in the provided answer choices, whereas MC2 includes multiple true answers. Therefore, Evaluation for MC1 is done by computing simple accuracy across all questions unlike the computation described in the "Problem 1b Q2."
- **Difference between MC1 and text classification tasks**: Multiple answer options that the model can choose from by assigning the highest probability (or log probability) are given in the MC1 framework, whereas no choices and only a text are given in text classification tasks. Thus, MC1 reflects the Question-Answering settings.


