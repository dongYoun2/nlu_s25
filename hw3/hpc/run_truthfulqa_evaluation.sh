# Add all your Python calls here:
# without specifying '--demos' option uses the default demonstrations file which is 'demonstrations.txt'

python truthfulqa.py facebook/opt-125m  # same as adding "--demos 'demonstrations.txt"
python truthfulqa.py facebook/opt-350m
python truthfulqa.py facebook/opt-1.3b
python truthfulqa.py facebook/opt-2.7b
python truthfulqa.py facebook/opt-6.7b

python truthfulqa.py facebook/opt-1.3b --no-demos
python truthfulqa.py facebook/opt-1.3b --demos 'demonstrations.txt'
python truthfulqa.py facebook/opt-1.3b --system-prompt 'Actually,' --no-demos
python truthfulqa.py facebook/opt-1.3b --demos 'demonstrations.txt' --system-prompt 'Actually,'

# extra credit (both achieves acc >= 0.3)
python truthfulqa.py facebook/opt-1.3b --system-prompt 'Truthfully...'
python truthfulqa.py facebook/opt-1.3b --system-prompt 'Despite popular belief,'
# ... etc.