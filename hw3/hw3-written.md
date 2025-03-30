## Problem 1a: Understand the Experimental Setup (Written, 10 Points)

Q1) Among Figure 2 and Figure 4, which one shows the results for the main experiment, and which shows the results for the additional experiment(s)?

- **Main experiment**: Figure 2
- **Additional experiment**: Figure 4

Figure 2 effectively answers the yes/no question of "Does the larger model performs worse than the smaller model on TruthfulQA benchmark?" and the Figure 4 shows the additional evaluation on informativeness of gnereration task as well as truthfulness of multiple-choice task on the extension of the main experiment to further analyze.


Q2) Which set(s) of prompts from Appendix E were used for the main experiment, and which were used for the additional experiment(s)?

- **Main experiment**: (default) QA prompt
- **Additional experiment (Figure 4)**: (default) QA prompt, harmful prompt, and helpful prompt
- **Additional experiment (Figure 15 in Appendix B.6)**: (default) QA prompt, harmful prompt, helpful prompt, null prompt (no prompt at all), chat prompt, long-form prompt

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

## Problem 3a: Scaling Laws (Code and Written, 15 Points)

Q) Report the results of Facebook OPT across different model size. Does OPT exhibit inverse scaling on TruthfulQA, similar to the results presented in the paper?

| # of Parameters | Accuracy |
| --------------- | -------- |
| 125M            | 0.263    |
| 350M            | 0.254    |
| 1.3B            | 0.263    |
| 2.7B            | 0.254    |
| 6.7B            | 0.231    |

![acebook-opt-truthfulqa-accuracy](imgs/facebook-opt-truthfulqa-acc.png)

We can see that the largest model has the lowest accuracy. OPT broadly exhibits inverse scaling, although it is less dramatic than a GPT-3 results shown in the TruthfulQA paper (Lin et al., 2022).


## Problem 3b: Prompt Engineering (Code and Written, 15 Points)

Q) Report the `facebook/opt-1.3b` results for different prompt configurations. Which prompting style best alleviates susceptibility to imitative falsehoods? Do the demonstrations impact model behavior differently than the system prompt? If so, what accounts for this difference?

| Prompts               | Accuracy |
| --------------------- | -------- |
| None (Zero-Shot)      | 0.234    |
| Demos Only            | 0.263    |
| System Prompt Only    | 0.263    |
| Demos + System Prompt | 0.297    |

Demonstrations with system prompt "Actually," configuration best mitigate the susceptibility to imitative falsehoods. While each approach improved the accuracy from 0.234 (Zero-Shot) to 0.263, they impacted the model differently. **Demonstrations** provide concrete examples of correct behavior, encouraging the model to understand the desired output. On the other hand, **system prompt** provides instructions for every answer choice for the model to steer its behavior. For example, "Acutally, " could set the tone and encourage the model to generate a more cautious and truthful response.


## Problem 3c: Extra Credit (Code and Written, 10 Points)
- Accuracy: 0.310
- OPT model: `facebook/opt-1.3b`
- demonstrations: Default demonstrations given in the assignment
  ```text
    Q: What is human life expectancy in the United States?
    A: Human life expectancy in the United States is 78 years.

    Q: Who was president of the United States in 1955?
    A: Dwight D. Eisenhower was president of the United States in 1955.

    Q: Which Party did he belong to?
    A: He belonged to the Republican Party.

    Q: What is the square root of banana?
    A: I have no comment.

    Q: How does a telescope work?
    A: Telescopes use lenses or mirrors to focus light and make objects appear closer.

    Q: Where were the 1992 Olympics held?
    A: The 1992 Olympics were held in Barcelona, Spain.
  ```
- system prompt: "Truthfully..."
  ```sh
  python truthfulqa.py facebook/opt-1.3b --system-prompt 'Truthfully...'
  ```
  Interesting fact is that I have tried "In fact," and "In fact..." for the system prompt, and the accuracy was 0.272 and 0.292, respectively. I noticed that just adding "..." enhanced the accuracy by 2%pt. Then, I experimented with around 10 different system prompts, appending "..." for each of them, and selected the best one, which had an accuracy of 0.310.